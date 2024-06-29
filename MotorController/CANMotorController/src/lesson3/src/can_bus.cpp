
#include "lesson3/can_bus.hpp"
#include <ros/ros.h>

namespace sp_hw
{
    /*!
     * @brief   constrain the number with limitiation.
     * @return  eg : limitAmplitude(-3000,1000) returns -1000
     */
    template <typename T>
    inline T limitAmplitude(T a, T limit)
    {
        limit = fabs(limit);
        int8_t sign = a < 0 ? -1 : 1;
        if (isnan(a))
            return 0.0;
        else if (fabs(a) < limit)
            return a;
        else
            return static_cast<float>(sign * limit);
    }

    CanBus::CanBus(const std::string &bus_name, CanDataPtr data_ptr, int thread_priority = 0)
        : bus_name_(bus_name), data_ptr_(data_ptr)
    {
        setlocale(LC_ALL, "");
        while (!socket_can_.open(bus_name_, boost::bind(&CanBus::frameCallback, this, _1), thread_priority) && ros::ok())
            ros::Duration(.5).sleep();

        ROS_INFO("Successfully connected to %s. ", bus_name.c_str());
        rm_can_frame0_.can_id = 0x200;
        rm_can_frame0_.can_dlc = 8;
        rm_can_frame1_.can_id = 0x1FF;
        rm_can_frame1_.can_dlc = 8;
    }
    /**
     * @brief 按照rm电机的can通讯协议写入电机命令
     * @param 
     */

    void CanBus::write()
    {
        bool has_write_frame0 = false, has_write_frame1 = false;
        std::fill(std::begin(rm_can_frame0_.data), std::end(rm_can_frame0_.data), 0);
        std::fill(std::begin(rm_can_frame1_.data), std::end(rm_can_frame1_.data), 0);

        for (auto &act_data : *data_ptr_.id2act_data_)
        {
            const ActCoeff &act_coeff = *data_ptr_.act_coeffs_;
            int id = act_data.first - 0x200;
            double cmd = limitAmplitude(act_coeff.effort2act * act_data.second.cmd, 10000.0);
            if (1 <= id && id <= 4)
            {
                rm_can_frame0_.data[2 * (id - 1)] = static_cast<uint8_t>(static_cast<int16_t>(cmd) >> 8u);
                rm_can_frame0_.data[2 * (id - 1) + 1] = static_cast<uint8_t>(cmd);
                has_write_frame0 = true;
            }
            else if (5 <= id && id <= 8)
            {
                rm_can_frame1_.data[2 * (id - 5)] = static_cast<uint8_t>(static_cast<int16_t>(cmd) >> 8u);
                rm_can_frame1_.data[2 * (id - 5) + 1] = static_cast<uint8_t>(cmd);
                has_write_frame1 = true;
            }  
        }

        if (has_write_frame0)
            socket_can_.write(&rm_can_frame0_);
        if (has_write_frame1)
            socket_can_.write(&rm_can_frame1_);
        
    }
    /**
     * @brief 对read_buffer_中的数据进行处理
     * @param time
     */
    void CanBus::read(ros::Time time)
    {
        std::lock_guard<std::mutex> guard(mutex_);
        for (const CanFrameStamp &can_frame_stamp : read_buffer_)
        {
            can_frame frame = can_frame_stamp.frame;
            // Check if the motor has been registered via ID

            ActData &act_data = data_ptr_.id2act_data_->find(frame.can_id)->second;
            const ActCoeff &act_coeff = *data_ptr_.act_coeffs_;    
            //根据rm电机协议读取回传数据
            int id = frame.can_id;
            uint16_t q_raw = (frame.data[0] << 8u) | frame.data[1];
            int16_t qd_raw = (frame.data[2] << 8u) | frame.data[3];
            int16_t mapped_current = (frame.data[4] << 8u) | frame.data[5];
            double temptrue = frame.data[6];

            //将数据转化为公制单位
            double position = act_coeff.act2pos * q_raw; 
            double velocity = act_coeff.act2vel * qd_raw; 
            double effort = act_coeff.act2effort * mapped_current;  

            act_data.pos = position;
            act_data.vel = velocity;
            act_data.eff = effort;                         
        }
        
        read_buffer_.clear();           
    }
    void CanBus::frameCallback(const can_frame &frame)
    {
        std::lock_guard<std::mutex> guard(mutex_);
        CanFrameStamp can_frame_stamp{.frame = frame, .stamp = ros::Time::now()};
        read_buffer_.push_back(can_frame_stamp);
    }


} // namespace sp_hw






