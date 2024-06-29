#!/usr/bin/python3
import serial
import time
import math
import struct

#ROS
import rospy
from std_msgs.msg import String
from std_msgs.msg import Float32

# from cybergear import CANMotorController 
set_angular = 0.

def initialize_serial_port(port, baudrate):
    # 初始化串口对象
    ser = serial.Serial(port, baudrate,timeout=1)
    return ser

def send_command(ser, command):
    # 发送命令到串口
    ser.write(bytes.fromhex(command)) 
    print(f"Command sent: {command}")
    # print(bytes.fromhex(command))

def float_to_hex(f):
    #将浮点数转换为4字节的二进制数据（单精度浮点数）
    packed = struct.pack('!f', f)
    # 将二进制数据转换为十六进制字符串
    hex_str = packed.hex()
    # 每2个字符为一组分割
    bytes_list = [hex_str[i:i+2] for i in range(0, len(hex_str), 2)]
    # 将字节顺序反转
    reversed_bytes_list = bytes_list[::-1]
    # 使用空格将每个字节分隔开
    spaced_hex_str = ' '.join(reversed_bytes_list)
    return spaced_hex_str

 
def receive_response(ser):
    # 读取串口响应
    response = ser.read(12)  # 假设应答帧的长度不超过100字节
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

import sys
import signal

def signal_handler(sig, frame):
    print('\nCtrl-C pressed! Cleaning up and exiting...')
    # 执行任何必要的清理操作
    #stop 通信类型(4)
    send_command(ser,'41 54 20 07 eb fc 08 01 00 00 00 00 00 00 00 0d 0a')
    
    # 关闭串口连接
    ser.close()
    sys.exit(0)

# def get_theta(msg):
#     set_angular = msg.data()
#     return msg.data()
    
if __name__ == "__main__":
    
    
    
    # 串口配置
    serial_port = '/dev/ttyUSB0'  # 替换为您的串口设备路径
    baud_rate = 921600  # 替换为您的串口波特率
    
    # 初始化串口
    ser = initialize_serial_port(serial_port, baud_rate)
    #进入AT
    ser.write(bytes.fromhex("41 54 2b 41 54 0d 0a"))
    
    #设置设备ID 通信模式为 7
    # set_id = "41 54 1c 07 eb fc 08 00 00 00 00 00 00 00 00 0d 0a"
    # send_command(ser, set_id)
    # response = receive_response(ser)
    # 进入位置模式 通信模式：18 -> 3-> 18 -> 18
    loc_mode_to_send = "41 54 90 07 eb fc 08 05 70 00 00 01 00 00 00 0d 0a"
    send_command(ser,loc_mode_to_send)
   
    while  True:
        
        set_angular = input()
        # exitkey = set_angular
        hex = receive_angular(float(set_angular)) #设置旋转角度
        
          # （通信类型18）0x7005 设置控制模式
        run_to_send = "41 54 18 07 eb fc 08 00 00 00 00 00 00 00 00 0d 0a" #电机使能(通信类型3)
        loc_ref_to_send = "41 54 90 07 eb fc 08 16 70 00 00 " + hex + " 0d 0a" #
        limit_spd_to_send = "41 54 90 07 eb fc 08 17 70 00 00 00 00 00 40 0d 0a" 
        set_spd_to_send = "41 54 90 07 eb fc 08 0a 70 00 00 00 00 80 3f 0d 0a"
        
        
        #设置电流的kp
        set_cur_kp = "41 54 90 07 eb fc 08 10 70 00 00 00 00 80 3f 0d 0a"
        send_command(ser,set_cur_kp)
        #ki
        # set_cur_kp = "41 54 90 07 eb fc 08 11 70 00 00 00 00 80 3f 0d 0a"
        # send_command(ser,set_cur_kp)
        
        #执行
        send_command(ser,run_to_send)
        send_command(ser,limit_spd_to_send)
        send_command(ser,loc_ref_to_send)
        
        #设置当前位置为机械零位
        set_zero_loc = "41 54 30 07 eb fc 08 01 00 00 00 00 00 00 00 0d 0a"
        send_command(ser,set_zero_loc)
        
        # signal.signal(signal.SIGINT, signal_handler)
        # print('Press Ctrl-C to exit.')
        # 等待一段时间以便设备响应
        if 'e' == input(): 
            send_command(ser,"41 54 20 07 eb fc 08 00 00 00 00 00 00 00 00 0d 0a")
            break
        else:
            continue
ser.close()
    

    
    
   