#include <ros/ros.h>
#include <chassis_ctrl/motion.h>
#include <std_msgs/Float32.h>


ros::Publisher pub;

void debug_message_pub(const std_msgs::Float32 &debug_mes)
{
    // debug: 收到yolo识别值 [x,y,z,theta]
    std::vector<std::vector<float>> cor(4, std::vector<float>(2, 0.0f));
    cor[0][0] = 25.f; cor[1][0] = 25.f ; cor[2][0]= 50.f; cor[3][0] = 90.f;
    cor[0][1] = 40.f; cor[1][1] = 40.f ; cor[2][1] = 40.f; cor[3][1] = 90.f;


     // Create a message
    chassis_ctrl::motion msg;

    if(int(debug_mes.data) == 0)
        msg.b_cybergear = false;
    if(int(debug_mes.data) == 1)
        msg.b_cybergear = true;

    // 设置线性模组固定速度
    msg.v_x = 250; msg.v_y = 250; msg.v_z = 250;

    // 存坐标数组
    for (int col = 0; col < 2; ++col) {
        for (int row = 0; row < 4; ++row) {
            msg.data[col * 4 + row] = cor[row][col];
        }
    }
    // 初始化点索引
    msg.p_index = 0;
    
    for (auto &a : msg.data)
    {
        printf("%f\n",a);
    }

    // Publish the chassis::motion message； gpio节点接收处理
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
