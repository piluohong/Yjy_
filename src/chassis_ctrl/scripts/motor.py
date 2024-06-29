#!/usr/bin/python3
import serial
import time
import math
import struct
import sys
import signal

import rospy
from std_msgs.msg import Float32

def initialize_serial_port(port, baudrate):
    ser = serial.Serial(port, baudrate, timeout=1)
    return ser

def send_command(ser, command):
    ser.write(bytes.fromhex(command))
    print(f"Command sent: {command}")

def float_to_hex(f):
    packed = struct.pack('!f', f)
    hex_str = packed.hex()
    bytes_list = [hex_str[i:i+2] for i in range(0, len(hex_str), 2)]
    reversed_bytes_list = bytes_list[::-1]
    spaced_hex_str = ' '.join(reversed_bytes_list)
    return spaced_hex_str

def receive_response(ser):
    response = ser.read(12)
    if response:
        print(f"Response received: {response.hex()}")
    else:
        print("No response received.")
    return response

def receive_angular(angular_z):
    rad_unit = math.degrees(1)
    rad_z = angular_z / rad_unit
    hex_representation = float_to_hex(rad_z)
    print(f"Float: {rad_z}")
    print(f"Hex: {hex_representation}")
    return hex_representation

def signal_handler(sig, frame):
    print('\nCtrl-C pressed! Cleaning up and exiting...')
    send_command(ser, '41 54 20 07 eb fc 08 01 00 00 00 00 00 00 00 0d 0a')
    ser.close()
    sys.exit(0)

def get_theta(msg):
    global ser
    set_angular = msg.data
    hex_angle = receive_angular(float(set_angular))
    
    run_to_send = "41 54 18 07 eb fc 08 00 00 00 00 00 00 00 00 0d 0a"
    loc_ref_to_send = f"41 54 90 07 eb fc 08 16 70 00 00 {hex_angle} 0d 0a"
    limit_spd_to_send = "41 54 90 07 eb fc 08 17 70 00 00 00 00 00 40 0d 0a"
    # set_spd_to_send = "41 54 90 07 eb fc 08 0a 70 00 00 00 00 80 3f 0d 0a"
    
    
    
    send_command(ser, run_to_send)
    send_command(ser, limit_spd_to_send)
    send_command(ser, loc_ref_to_send)
    
    set_zero_loc = "41 54 30 07 eb fc 08 01 00 00 00 00 00 00 00 0d 0a"
    send_command(ser, set_zero_loc)
    time.sleep(1)

if __name__ == "__main__":
    serial_port = '/dev/ttyUSB0'
    baud_rate = 921600

    ser = initialize_serial_port(serial_port, baud_rate)
    ser.write(bytes.fromhex("41 54 2b 41 54 0d 0a"))

    loc_mode_to_send = "41 54 90 07 eb fc 08 05 70 00 00 01 00 00 00 0d 0a"
    send_command(ser, loc_mode_to_send)
    
    set_cur_kp = "41 54 90 07 eb fc 08 10 70 00 00 00 00 80 3f 0d 0a"
    send_command(ser, set_cur_kp)

    rospy.init_node('motor', anonymous=True)
    rospy.Subscriber('/theta_z', Float32, get_theta)

    signal.signal(signal.SIGINT, signal_handler)
    print('Press Ctrl-C to exit.')

    rospy.spin()
    ser.close()
