#include <ros/ros.h>
#include <thread>
#include <chrono>
#include "lesson3/hardware_interface.hpp"




int main(int argc, char **argv)
{
    using clock = std::chrono::high_resolution_clock;
    ros::init(argc, argv, "sp_hw");
    ros::NodeHandle nh;
    ros::NodeHandle nh_p;
    std::string bus_name = "can0";   
    int thread_priority;
    // Initialise the hardware interface:
    // 1. retrieve configuration from rosparam
    // 2. initialise the hardware and interface it with ros_control
    std::shared_ptr<sp_hw::SpRobotHW> hardware_interface = std::make_shared<sp_hw::SpRobotHW>();
    hardware_interface->setCanBusThreadPriority(thread_priority);
    hardware_interface->init(nh, nh_p);
    ros::Rate loop_rate(5);

    auto current_time = clock::now();
    auto last_time = clock::now();

    
    
   
    int loop_hz = 1000;

    while(ros::ok())
    {
        current_time = clock::now();

        const std::chrono::duration<double> desired_duration(1.0 / loop_hz);
        // Get change in time
        std::chrono::duration<double> time_span = std::chrono::duration_cast<std::chrono::duration<double>>(current_time - last_time);

        ros::Duration elapsed_time_ = ros::Duration(time_span.count());

        hardware_interface->read(ros::Time::now(), elapsed_time_);

        hardware_interface->show();

        hardware_interface->write(ros::Time::now(), elapsed_time_);

        loop_rate.sleep();

        last_time = current_time;
    }
    return 0;
}
