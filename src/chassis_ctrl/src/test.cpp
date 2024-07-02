#include <ros/ros.h>
#include <chassis_ctrl/motion.h>
#include <std_msgs/Float32.h>


ros::Publisher pub;

void debug_message_pub(const std_msgs::Float32 &debug_mes)
{
    // debug: 收到yolo识别值 [x,y,z,theta]
    std::vector<float> cor {0,0,0,0};
    cor[0] = 100; cor[1] = 100 ; cor[2] = 40; cor[3] = 90;

     // Create a message
    chassis_ctrl::motion msg;
    if(int(debug_mes.data) == 0)
        msg.b_cybergear = false;
    if(int(debug_mes.data) == 1)
        msg.b_cybergear = true;
    // Initialize the data array
    int rows = 4; // Update with your actual row size
    int cols = 1; // Update with your actual column size
    msg.data.resize(rows * cols);

    // Fill the data array
    msg.data[0] = 40;  msg.data[1] = 40; msg.data[2] = 40;
    msg.data[3] = cor[3];

    msg.t_x = float(cor[0] / msg.data[0]) ; msg.t_y = float(cor[1] / msg.data[1]); msg.t_z = float(cor[2]/msg.data[2]); // s 
    msg.dir_x = 0;msg.dir_y = 1;msg.dir_z = 1;

    

    ROS_INFO("Input t data:%f,%f,%f,%f: ",msg.t_x,msg.t_y,msg.t_z, msg.data[3]);
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
