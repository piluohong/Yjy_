#!/usr/bin/python3
import logging 
import can
from time import sleep

from cybergear import CANMotorController 

#Initialize logging
logging.basicConfig(
 level=logging.ERROR, format="%(asctime)s - %(levelname)s - %(message)s"
)

# 初始化CAN总线
bus = can.interface.Bus(bustype="socketcan", channel="can0", bitrate=1000000)


