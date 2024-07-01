#include <ros/ros.h>
#include <chassis_ctrl/motion.h>
#include <std_msgs/Float32.h>


ros::Publisher pub;

void debug_message_pub(const std_msgs::Float32 &debug_mes)
{
     // Create a message
    chassis_ctrl::motion msg;
    // Initialize the data array
    int rows = 4; // Update with your actual row size
    int cols = 1; // Update with your actual column size
    msg.data.resize(rows * cols);
    // Fill the data array
    msg.data[0] = 0 ;  msg.data[1] = 30; msg.data[2] = 0;
    msg.data[3] = 90;

    msg.dir_x = msg.dir_y = msg.dir_z = 0;

    ROS_INFO("Input data:%f,%f,%f,%f: ",msg.data[0],msg.data[1],msg.data[2],msg.data[3]);
    // Publish the message

    pub.publish(msg);
    // sleep(1);
}

int main(int argc, char **argv)
{
    setlocale(LC_ALL, "");
    
    ros::init(argc, argv, "xyz");
    ros::NodeHandle nh;
    ROS_INFO("\033[1;32m----> test_node Started.\033[0m");

    pub = nh.advertise<chassis_ctrl::motion>("/xyz_node/xyz_action", 10);
    ros::Subscriber action_ = nh.subscribe("/debug_mes", 10, debug_message_pub);
    
    // printf("%f,%f,%f: ",msg.data[0],msg.data[1],msg.data[2]);
    ros::MultiThreadedSpinner spinner(2);
    spinner.spin();

    return 0;
}
