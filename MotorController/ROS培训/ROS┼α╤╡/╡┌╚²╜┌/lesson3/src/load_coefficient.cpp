#include "ros/ros.h"
 

int main(int argc,char *argv[])
{
    //执行ros节点初始化
    ros::init(argc,argv,"load_coefficient");//Hello_World是节点名称
    //创建ros节点句柄
    ros::NodeHandle nh;
    double act2pos_3508;
    //创建一张表格（实则为字典类型）储存读取的数据
    XmlRpc::XmlRpcValue xml_rpc_value1;
    XmlRpc::XmlRpcValue xml_rpc_value2;
    //使用刚才创建的句柄获取参数，注意这些参数必须已经发布到参数空间中，
    //并且所属的命名空间与句柄命名空间相同

    //读取rm3508电机的act2pos参数，注意该参数为double类型，所以使用double变量储存
    nh.getParam("actuator_coefficient/rm_3508/act2pos", act2pos_3508);
    //读取所有rm3508电机的参数，这些参数以字典（键值对）形式储存，使用XmlRpcValue这一特殊格式储存所有键值对类型的数据
    nh.getParam("actuator_coefficient/rm_3508", xml_rpc_value1);
     //读取所有电机的参数，这些参数先分成rm3508和rm2006的部分，再以字典（键值对）形式储存
    nh.getParam("actuator_coefficient", xml_rpc_value2);
    //打印获取的参数
    ROS_INFO_STREAM("act2pos: "<< act2pos_3508);
    ROS_INFO_STREAM("rm3508: " << xml_rpc_value1);
    ROS_INFO_STREAM("motor_coefficient: " << xml_rpc_value2);

    return 0;
}
