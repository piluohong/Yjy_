#!/usr/bin/env python3
#coding=utf-8

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
import time
import math
 
# def talker():
#      pub = rospy.Publisher('chatter', String, queue_size=10)
#      rospy.init_node('talker', anonymous=True)
#      rate = rospy.Rate(10) # 10hz
#      while not rospy.is_shutdown():
#          hello_str = "hello world %s" % rospy.get_time()
#          rospy.loginfo(hello_str)
#          pub.publish(hello_str)
#          rate.sleep()

def init ():
    print("init_success and draw a circle!")
    
def drawACircle ():
    pub_cmd_vel = rospy.Publisher('/turtle1/cmd_vel',Twist,queue_size=10)
    rospy.init_node('chassis_ctrl',anonymous=True)
    
    msg = Twist()
    
    # name = input()
    # if name == 'e' :
    #     msg.linear.x = 0
    #     msg.angular.z = 0
    #     pub_cmd_vel.publish(msg)
    #     print("Stop with linear.x, angular.z = ",msg.linear.x,msg.angular.z)
    # else :  
    for i in range(5, 0, -1):     
        rate =  rospy.Rate(10)
        while not rospy.is_shutdown():
            # msg.header.stamp = rospy.get_rostime()
            msg.linear.x = 0.01
            msg.angular.z = 0
            
            pub_cmd_vel.publish(msg)
            # print("linear.x, angular.z = ",msg.linear.x,msg.angular.z）
            
            
            rate.sleep()
        print(i)
        time.sleep(1) 
    
   
def drawARectangle ():
    pub_cmd_vel = rospy.Publisher('/auto_cmd_vel',Twist,queue_size=1000)
    rospy.init_node('chassis_ctrl',anonymous=True)
    
    #倒计时5s
    for i in range(5, 0, -1):
        print(i)
        time.sleep(1)
        
    msg = Twist()
    msg.linear.x = 0.3000
    lt_start = rospy.get_time()
    print(lt_start)
    #沿着直线运行4秒
    while (rospy.get_time() - lt_start) <= 10.0 :
        pub_cmd_vel.publish(msg)
        t_end = rospy.get_time()
    else:
        print("1直线完成",t_end)
    
    #左转弯90度
    msg.angular.z = 1.0
    msg.linear.x = 0.2
    degree = math.degrees(0.5)
    cost_t = 90 / degree
    ct_start = rospy.get_time()
    while (rospy.get_time() - ct_start) <= cost_t :
        pub_cmd_vel.publish(msg)
        t_end = rospy.get_time()
    else:
        print("1转弯完成",t_end)
        
    #沿着直线运行4秒
    msg.linear.x = 0.3000
    msg.angular.z = 0
    lt_start = rospy.get_time()
    while (rospy.get_time() - lt_start) <= 10.0 :
        pub_cmd_vel.publish(msg)
        t_end = rospy.get_time()
    else:
        print("2直线完成",t_end)
    
    #左转弯90度
    msg.angular.z = -1.0
    msg.linear.x = 0.2
    degree = math.degrees(0.5)
    cost_t = 90 / degree
    ct_start = rospy.get_time()
    while (rospy.get_time() - ct_start) <= cost_t :
        pub_cmd_vel.publish(msg)
        t_end = rospy.get_time()
    else:
        print("2转弯完成",t_end)
    
    
    
    
    
    


if __name__ == '__main__':
     try:
         init()
        #  drawARectangle()   
         drawACircle()  
     except rospy.ROSInterruptException:
         pass