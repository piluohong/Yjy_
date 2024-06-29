#pragma once

#include <string>
#include <mutex>

#include <ros/ros.h>
#include "lesson3/socketcan.h"
#include "lesson3/data_types.hpp"

namespace sp_hw
{
    struct CanFrameStamp
    {
        can_frame frame;
        ros::Time stamp;
    };

    class CanBus
    {
    public:
        CanBus(const std::string &bus_name, std::unordered_map<int, sp_hw::ActDataSimple> *id2act_data, int thread_priority);

        void read(ros::Time time);

        void write();

        void write(can_frame *can_frame);

        const std::string bus_name_;


    private:
        void frameCallback(const can_frame &frame);
        sp_hw::SocketCAN socket_can_;
        // a simple FIFO to store can_data
        std::vector<CanFrameStamp> read_buffer_;

        std::unordered_map<int, ActDataSimple> *id2act_data_;

        can_frame rm_can_frame0_;
        can_frame rm_can_frame1_;

        mutable std::mutex mutex_;
        ros::NodeHandle nh;

        double act2pos;
        double act2vel;
        double act2eff;
        double eff2act;
    };
}