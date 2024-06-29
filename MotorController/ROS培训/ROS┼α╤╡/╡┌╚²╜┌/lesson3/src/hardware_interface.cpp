#include "lesson3/hardware_interface.hpp"
#include "lesson3/param_processor.hpp"

namespace sp_hw
{
    bool SpRobotHW::init(ros::NodeHandle &root_nh, ros::NodeHandle &robot_hw_nh)
    {

        initCanBus();
        XmlRpc::XmlRpcValue xml_rpc_value;

        if (!robot_hw_nh.getParam("actuator_coefficient", xml_rpc_value))
            ROS_ERROR("No Actuator Coefficient Specified");
        else if (!parseActCoeffs(xml_rpc_value))
            return false;

        if (!robot_hw_nh.getParam("actuators", xml_rpc_value))
            ROS_ERROR("No Actuator Specified");
        else if (!parseActTypes(xml_rpc_value))
            return false;
              
        return true;
    }
    /**
     * @brief 已挂载电机信息显示
     * @param id2device_data
     */
    template <typename T>
    void device_tree(const std::unordered_map<int, T> &id2device_data)
    {
        std::cout << "|-- " << "can0" << std::endl;
        for (auto &device_data : id2device_data)
        {
            std::cout << "|   "
                        << "|-- "
                        << "0x" << std::hex << device_data.first << " - " << std::dec
                        << device_data.second.type << " - " << device_data.second.name << std::endl; 
        }

    }
    /**
     * @brief 加载电机参数
     * @param act_coeffs
     */
    bool SpRobotHW::parseActCoeffs(XmlRpc::XmlRpcValue &act_coeffs)
    {
        ROS_ASSERT(act_coeffs.getType() == XmlRpc::XmlRpcValue::TypeStruct);
        for (auto act_coeff : act_coeffs)
        {
            if (act_coeff.first == "rm_3508")
            {
                if (act_coeff.second.hasMember("act2pos"))
                    act_coeffs_.act2pos = xmlRpcGetDouble(act_coeff.second, "act2pos");
                else
                    ROS_WARN_STREAM("Actuator Type " << act_coeff.first << " has no associated act2pos");

                if (act_coeff.second.hasMember("act2vel"))
                    act_coeffs_.act2vel = xmlRpcGetDouble(act_coeff.second, "act2vel");
                else
                    ROS_WARN_STREAM("Actuator Type " << act_coeff.first << " has no associated act2vel");

                if (act_coeff.second.hasMember("act2effort"))
                    act_coeffs_.act2effort = xmlRpcGetDouble(act_coeff.second, "act2effort");
                else
                    ROS_WARN_STREAM("Actuator Type " << act_coeff.first << " has no associated act2effort");

                if (act_coeff.second.hasMember("effort2act"))
                    act_coeffs_.effort2act = xmlRpcGetDouble(act_coeff.second, "effort2act");
                else
                    ROS_WARN_STREAM("Actuator Type " << act_coeff.first << " has no associated effort2act");
            }
        }
        return true;
    }

    /**
     * @brief 挂载电机
     * @param act_types
     */
    bool SpRobotHW::parseActTypes(XmlRpc::XmlRpcValue &act_types)
    {
        ROS_ASSERT(act_types.getType() == XmlRpc::XmlRpcValue::TypeStruct);

        for (auto it = act_types.begin(); it != act_types.end(); ++it)
        {
            if (!it->second.hasMember("bus"))
            {
                ROS_ERROR_STREAM("Actuator " << it->first << " has no associated bus.");
                continue;
            }
            else if (!it->second.hasMember("type"))
            {
                ROS_ERROR_STREAM("Actuator " << it->first << " has no associated type.");
                continue;
            }
            else if (!it->second.hasMember("id"))
            {
                ROS_ERROR_STREAM("Actuator " << it->first << " has no associated ID.");
                continue;
            }

            std::string bus = it->second["bus"], type = it->second["type"];
            int id = it->second["id"];

            //构建电机表
            //电机ID---->电机数据(ActData)

            if (!(id2act_data_.find(id) == id2act_data_.end()))
            {
                ROS_ERROR_STREAM("Repeat actuator on can0 and ID 0x" << std::hex << id);
                return false;
            }
            else
            {
                id2act_data_.emplace(std::make_pair(id, ActData{.name = it->first,
                                                                .type = type,
                                                                .pos = 0.0,
                                                                .vel = 0.0,
                                                                .eff = 0.0,
                                                                .cmd = 0.0}));
            }
        }

        device_tree<ActData>(id2act_data_);
        return true;
    }

    void SpRobotHW::read(const ros::Time &time, const ros::Duration &period)
    {
        can_bus_->read(time);
    }

    void SpRobotHW::write(const ros::Time &time, const ros::Duration &period)
    {
        can_bus_->write();
    }

    /**
     * @brief 初始化canbus
     * @param 
     */
    void SpRobotHW::initCanBus()
    {
        can_bus_ = std::make_unique<CanBus>("can0", CanDataPtr{.act_coeffs_ = &act_coeffs_,
                                            .id2act_data_ = &id2act_data_}, thread_priority_);
    }

    void SpRobotHW::show()
    {
        for (auto &act_data : id2act_data_)
        {
            if (act_data.first == 0x201)
            {      
                ROS_INFO_STREAM("----------------------------------");
                ROS_INFO_STREAM("id: " << std::hex << act_data.first);
                ROS_INFO_STREAM("pos: " << act_data.second.pos << "rad");
                ROS_INFO_STREAM("vel: " << act_data.second.vel << "rad/s");
                ROS_INFO_STREAM("eff: " << act_data.second.eff << "N.m");
                ROS_INFO_STREAM("cmd: " << act_data.second.cmd << "N.m"); 
                act_data.second.cmd = 0.015;
            } 
        }     
    }

    void SpRobotHW::setCanBusThreadPriority(const int &thread_priority) { thread_priority_ = thread_priority; }

} // namespace sp_hw