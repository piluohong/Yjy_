#pragma once

#include <unordered_map>
#include <ros/ros.h>

namespace sp_hw
{
    struct ActCoeff
    {
        double act2pos, act2vel, act2effort, effort2act;
    };

    struct ActDataSimple
    {
        double pos, vel, eff;
        double cmd;
    };

    struct ActData
    {
        std::string name;
        std::string type;
        double pos, vel, eff;
        double cmd;
    };

    struct CanDataPtr
    {
        ActCoeff *act_coeffs_;
        std::unordered_map<int, ActData> *id2act_data_;
    };
} // namespace : sp_hw