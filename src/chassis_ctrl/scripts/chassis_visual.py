#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist, Pose, Point, Quaternion
from nav_msgs.msg import Odometry
from std_msgs.msg import Float32
import tf
import math

class VehicleModel:
    def __init__(self):
        rospy.init_node('vehicle_model', anonymous=True)
        self.pose_pub = rospy.Publisher('/vehicle/pose', Pose, queue_size=10)
        self.odom_pub = rospy.Publisher('/vehicle/odom', Odometry, queue_size=10)
        rospy.Subscriber('/cmd_vel', Twist, self.cmd_vel_callback)
        self.odom_broadcaster = tf.TransformBroadcaster()
        self.rate = rospy.Rate(10)  # 10 Hz

        self.x = 0.0
        self.y = 0.0
        self.theta = 0.0
        self.vx = 0.0
        self.vy = 0.0
        self.vth = 0.0

    def cmd_vel_callback(self, msg):
        self.vx = msg.linear.x
        self.vy = msg.linear.y
        self.vth = msg.angular.z

    def update_pose(self):
        dt = 0.1  # Assuming a fixed time step of 0.1 seconds

        delta_x = self.vx * math.cos(self.theta) * dt
        delta_y = self.vx * math.sin(self.theta) * dt
        delta_theta = self.vth * dt

        self.x += delta_x
        self.y += delta_y
        self.theta += delta_theta
        
        

        # Update pose
        pose = Pose()
        pose.position = Point(self.x, self.y, 0)
        quaternion = tf.transformations.quaternion_from_euler(0, 0, self.theta)
        pose.orientation = Quaternion(*quaternion)

        self.pose_pub.publish(pose)
        
        # Publish the transform over tf
        self.odom_broadcaster.sendTransform(
            (self.x, self.y, 0),
            tf.transformations.quaternion_from_euler(0, 0, self.theta),
            rospy.Time.now(),
            "base_link",
            "odom")

        # Update odometry
        odom = Odometry()
        odom.header.stamp = rospy.Time.now()
        odom.header.frame_id = "odom"
        odom.pose.pose = pose
        odom.child_frame_id = "base_link"
        odom.twist.twist.linear.x = self.vx
        odom.twist.twist.linear.y = self.vy
        odom.twist.twist.angular.z = self.vth

        self.odom_pub.publish(odom)

    def run(self):
        while not rospy.is_shutdown():
            self.update_pose()
            self.rate.sleep()

if __name__ == '__main__':
    try:
        vehicle = VehicleModel()
        vehicle.run()
    except rospy.ROSInterruptException:
        pass
