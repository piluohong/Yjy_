#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<unistd.h>
#include<sys/io.h>
#include<ctype.h>
#include<pthread.h>

//ROS
#include <ros/ros.h>
#include "chassis_ctrl/cordinateArray.h"

#define GREEN "\033[92m"
#define RESET "\033[0m"

#define GPIO_0 7
#define GPIO_1 6
#define GPIO_2 5
#define GPIO_3 4
#define GPIO_4 3
#define GPIO_5 2
#define GPIO_6 1
#define GPIO_7 0
//模组行进方向
#define DIR_POI 1
#define DIR_REV 0
//工控机输出频率
#define FEQ 400
//GPIO地址
uint16_t addr = 0xA06;     // address of gpio


//模组的位移量
typedef struct 
{
    double x_move;//每个轴的位移绝对值，单位mm
    double y_move;
    double z_move;
    int x_dir;
    int y_dir;
    int z_dir;
}module_displacement;


//读出GPIO端口电平
static inline uint8_t gpio_bit_read(uint16_t addr, uint8_t bit){
	uint8_t value = 0;
	ioperm(addr,2,1);
	value = inb(addr);
	ioperm(addr,2,0);
	value = value & (1 << bit);
	value = value >> bit;
	return value;
}

//写入GPIO端口电平
static inline int8_t gpio_bit_write(uint16_t addr, uint8_t bit, uint8_t val){
	uint8_t read_value = 0;
	if( val != 0 && val != 1)
		return -1;//incorrect bit value of a gpio
	ioperm(addr,2,1);
	read_value = inb(addr);
	read_value = read_value & (~(1 << bit));// clear value of addr.bit
	read_value = read_value | (val << bit);// set value of addr.bit to val
	outb(read_value, addr);
	ioperm(addr,2,0);
	return 1;
}

//翻转电平
static inline void gpio_toggle_bit(uint16_t addr, uint8_t bit) {
    uint8_t value = gpio_bit_read(addr, bit);
    if(value==1) value=0;
    else value=1;
    gpio_bit_write(addr, bit, value);
}

//电机转动圈数控制
void generate_square_wave(int addr, uint8_t bit_move, uint8_t bit_dir,int frequency,double distance,int dir) {
    if(dir)
    {
        gpio_bit_write(addr,bit_dir,1);
        int duration = 500000 / frequency;
        for (int i = 0; i < (int)(distance*10); i++) {
            gpio_toggle_bit(addr, bit_move); // 切换GPIO端口的高低电平
            usleep(duration);            // 等待高电平持续时间
            gpio_toggle_bit(addr, bit_move); // 再次切换GPIO端口的高低电平
            usleep(duration);             // 等待低电平持续时间
        }
    }
    else
    {
        gpio_bit_write(addr,bit_dir,0);
        int duration = 500000 / frequency;
        for (int i = 0; i < (int)(distance*10); i++) {
            gpio_toggle_bit(addr, bit_move); 
            usleep(duration);            
            gpio_toggle_bit(addr, bit_move); 
            usleep(duration);             
        }
    }

}

//控制模组完成位移
int module_displace(module_displacement* dis)
{
    double x=dis->x_move;
    double y=dis->y_move;
    double z=dis->z_move;
    int dir_x=dis->x_dir;
    int dir_y=dis->y_dir;
    int dir_z=dis->z_dir;
    //完成x轴的运动
    generate_square_wave(addr,GPIO_0,GPIO_1,FEQ,x,dir_x);
    //完成y轴的运动
    generate_square_wave(addr,GPIO_2,GPIO_3,FEQ,y,dir_y);
    //完成z轴的运动
    generate_square_wave(addr,GPIO_4,GPIO_5,FEQ,z,dir_z);
}

/*//创建线程使三个方向同时运动
void* thread_func(void* arg) {
    module_displacement* dis = (module_displacement*)arg;
    generate_square_wave(addr, GPIO_0, GPIO_1, FEQ, dis->x_move, dis->x_dir);
    generate_square_wave(addr, GPIO_2, GPIO_3, FEQ, dis->y_move, dis->y_dir);
    generate_square_wave(addr, GPIO_4, GPIO_5, FEQ, dis->z_move, dis->z_dir);
    return NULL;
}*/

void xyz_nodeCallback(const chassis_ctrl::cordinateArray &msg)
{
    auto xyz_msg = msg;

    module_displacement dis;
    dis.x_move = xyz_msg.data[1,1]; // x轴位移
    dis.y_move = xyz_msg.data[2,1]; // y轴位移
    dis.z_move = xyz_msg.data[3,1]; // z轴位移
    dis.x_dir = xyz_msg.dir_x; // 1：+x；0：-x
    dis.y_dir = xyz_msg.dir_y; // 1：+y；0：-y
    dis.z_dir = xyz_msg.dir_z; // 1: +z; 0: -z
    
    //执行线性模组
    module_displace(&dis);
}

int main(int argc, char **argv)
{
    setlocale(LC_ALL, "");
    
    ros::init(argc, argv, "xyz_node");
    ros::NodeHandle nh_;
    ROS_INFO("\033[1;32m----> xyz_node Started.\033[0m");
    ros::Subscriber xyz_sub = nh_.subscribe("/xyz_node/xyz_action",1,&xyz_nodeCallback);
    
    ros::spin();
    return 0;
}