#pragma once

#include <unordered_map>

#include <ros/ros.h>
#include <urdf/model.h>
#include <XmlRpcValue.h>

/* ROS Control */
#include <hardware_interface/robot_hw.h>


/* SP HW */
#include "lesson3/data_types.hpp"
#include "lesson3/can_bus.hpp"


namespace sp_hw
{
    class SpRobotHW : public hardware_interface::RobotHW
    {
    public:
        SpRobotHW() = default;
        
        void setCanBusThreadPriority(const int &thread_priority);

        bool init(ros::NodeHandle &root_nh, ros::NodeHandle &robot_hw_nh) override;

        void write(const ros::Time &time, const ros::Duration &period);

        void read(const ros::Time &time, const ros::Duration &period);

        void show();

    private:

        int thread_priority_ = 0;
        // Param Parse
        bool parseActCoeffs(XmlRpc::XmlRpcValue &act_coeffs);

        bool parseActTypes(XmlRpc::XmlRpcValue &act_types);
    
        void initCanBus();   

        std::unique_ptr<CanBus> can_bus_;

        CanDataPtr data_ptr;

        ActCoeff act_coeffs_;

        std::unordered_map<int, ActData> id2act_data_;

        ros::Time last_publish_time_;

    };
} // namespace : sp_hw
