/*
 * @Author: piluohong 1912694135@qq.com
 * @Date: 2024-06-25 11:19:39
 * @LastEditors: piluohong 1912694135@qq.com
 * @LastEditTime: 2024-06-26 14:15:03
 * @FilePath: /yjy/src/chassis_ctrl/src/joy.cpp
 * @Description: 订阅 虚拟遥控器映射并发布线速度.x和角速度.z
 */
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Joy.h>
#include <std_msgs/Float32.h>
#include <time.h>
#include "chassis_ctrl/motion.h"



class TeleopTurtle
{
public:
    TeleopTurtle();

private:
    // 处理手柄发送过来的信息
    void callback(const sensor_msgs::Joy::ConstPtr &joy);
    // 实例化ROS句柄
    ros::NodeHandle nh;
    // 定义订阅者对象，用来订阅手柄发送的数据
    ros::Subscriber sub;
    // 定义发布者对象，用来将手柄数据发布到乌龟控制话题上
    ros::Publisher pub;
    // 用来接收launch文件中设置的参数，绑定手柄摇杆、轴的映射
    int axis_linear, axis_angular;

    //发布linear_x;angular_z
    ros::Publisher linear_x_pub;
    ros::Publisher angular_z_pub;
    ros::Publisher time_duration_pub;

    // 线性模组debug
    // ros::Publisher xyz_pub;

};

TeleopTurtle::TeleopTurtle()
{
    // 从参数服务器读取的参数
    nh.param<int>("axis_linear", axis_linear, 4);
    nh.param<int>("axis_angular", axis_angular, 3);

    sub = nh.subscribe<sensor_msgs::Joy>("joy", 10, &TeleopTurtle::callback, this);

    pub = nh.advertise<geometry_msgs::Twist>("/joy/cmd_vel", 10);
    time_duration_pub = nh.advertise<std_msgs::Float32>("/joy/time_duration_gui",1);
    linear_x_pub = nh.advertise<std_msgs::Float32>("/joy/linear_x",1);
    angular_z_pub = nh.advertise<std_msgs::Float32>("/joy/angular_z",1);

    // 线性模组debug
    // xyz_pub = nh.advertise<chassis_ctrl::motion>("/xyz_node/xyz_action", 1);

    
}

void TeleopTurtle::callback(const sensor_msgs::Joy::ConstPtr &joy)
{
    static int cnt = 0;
    geometry_msgs::Twist vel;
    std_msgs::Float32 linear_x, angular_z, time_duration;
    // 将手柄摇杆轴拨动时值的输出赋值给乌龟的线速度和角速度
    linear_x.data = vel.linear.x = joy->axes[axis_linear];
    angular_z.data = vel.angular.z = joy->axes[axis_angular];
    
    time_duration.data = cnt;
    ROS_INFO("当前线速度为:%.3lf ; 角速度为:%.3lf", vel.linear.x, vel.angular.z);
    pub.publish(vel);
    linear_x_pub.publish(linear_x);
    angular_z_pub.publish(angular_z);
    time_duration_pub.publish(time_duration);
    cnt+=1;

    //  Create a message
    // chassis_ctrl::motion msg;
    
}

int main(int argc, char **argv)
{
    setlocale(LC_ALL, "");
    
    ros::init(argc, argv, "teleop_turtle");
    ROS_INFO("\033[1;32m----> Control Joy Started.\033[0m");
    
    TeleopTurtle teleopTurtle;
    
    // std_msgs::Float32 linear_x, angular_z, time_duration;
    // linear_x.data = angular_z.data = 1.0,time_duration.data = 0;
    // ros::Rate rate(10);
    // while(ros::ok())
    // {
        
    //     linear_x_pub.publish(linear_x);
    //     angular_z_pub.publish(angular_z);
    //     time_duration_pub.publish(time_duration);
    //     time_duration.data += 1;
    //     rate.sleep();
    // }
    ros::MultiThreadedSpinner spinner(3);
    spinner.spin();
    return 0;
}

