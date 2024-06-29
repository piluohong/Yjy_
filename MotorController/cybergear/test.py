#!/usr/bin/python3

# from tools import CANMotorController
import serial
import struct
import time
 




if __name__ == '__main__':
    # Connect to the CAN bus with 1 Mbit/s bitrate
    port = "/dev/ttyUSB0"
    ser = serial.Serial(port, 921600, timeout=1)
     # Enter "AT command mode"
    ser.write(bytes.fromhex('41 54 2b 41 54 0d 0a'))
    
    ser.write(bytes.fromhex('41 54 90 07 eb fc 08 05 70 00 00 07 01 95 54 0d 0a'))
    for i in range(10,0,-1):
        print(i)
        time.sleep(1)
    ser.write(bytes.fromhex('41 54 90 07 eb fc 08 05 70 00 00 07 00 7f ff 0d 0a'))
    # Close the serial port
    # ser.close()