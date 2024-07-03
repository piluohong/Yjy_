#include <iostream>
#include <thread>
#include <chrono>
#include <ros/ros.h>
#include "chassis_ctrl/motion.h"
#include <std_msgs/Float32.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/io.h>
#include <ctype.h>
#include <pthread.h>
#include <mutex>

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
// 模组行进方向
#define DIR_POI 1
#define DIR_REV 0
// 工控机输出频率
#define FEQ 557

ros::Publisher theta_z_pub;
uint16_t addr = 0xA06;     // address of gpio
std::mutex gpio_mutex;

typedef struct {
    double x_move;  // 每个轴的位移绝对值，单位mm
    double y_move;
    double z_move;
    float z_theta;
    int x_dir;
    int y_dir;
    int z_dir;
} module_displacement;

static inline uint8_t gpio_bit_read(uint16_t addr, uint8_t bit) {
    std::lock_guard<std::mutex> lock(gpio_mutex);
    if (bit > 7) {
        fprintf(stderr, "Invalid GPIO bit: %d\n", bit);
        return 0;
    }
    uint8_t value = 0;
    if (ioperm(addr, 2, 1)) {
        perror("ioperm");
        return 0;
    }
    value = inb(addr);
    if (ioperm(addr, 2, 0)) {
        perror("ioperm");
    }
    value = value & (1 << bit);
    value = value >> bit;
    return value;
}

static inline int8_t gpio_bit_write(uint16_t addr, uint8_t bit, uint8_t val) {
    std::lock_guard<std::mutex> lock(gpio_mutex);
    if (bit > 7 || (val != 0 && val != 1)) {
        fprintf(stderr, "Invalid GPIO bit or value: bit=%d, val=%d\n", bit, val);
        return -1;
    }
    uint8_t read_value = 0;
    if (ioperm(addr, 2, 1)) {
        perror("ioperm");
        return -1;
    }
    read_value = inb(addr);
    read_value = read_value & (~(1 << bit)); // clear value of addr.bit
    read_value = read_value | (val << bit);  // set value of addr.bit to val
    outb(read_value, addr);
    if (ioperm(addr, 2, 0)) {
        perror("ioperm");
    }
    return 1;
}

static inline void gpio_toggle_bit(uint16_t addr, uint8_t bit) {
    uint8_t value = gpio_bit_read(addr, bit);
    gpio_bit_write(addr, bit, !value);
}

void generate_square_wave(int addr, uint8_t bit_move, uint8_t bit_dir, int frequency, double distance, int dir) {
    if (distance < 0) {
        fprintf(stderr, "Invalid distance: %f\n", distance);
        return;
    }
    gpio_bit_write(addr, bit_dir, dir);
    int duration = 500000 / frequency;
    for (int i = 0; i < static_cast<int>(distance*2); i++) {
        gpio_toggle_bit(addr, bit_move); // 切换GPIO端口的高低电平
        usleep(duration);                // 等待高电平持续时间
        gpio_toggle_bit(addr, bit_move); // 再次切换GPIO端口的高低电平
        usleep(duration);                // 等待低电平持续时间
    }
}

void module_displace_x(module_displacement* dis, chassis_ctrl::motion &msg) {
    printf("----> 执行x\n");
    printf("执行时间tx： %f\n.",msg.t_x);
    auto start = std::chrono::steady_clock::now();
    while (true) {
        
        generate_square_wave(addr, GPIO_0, GPIO_1, FEQ, dis->x_move, dis->x_dir);
        auto end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed = end - start;
        if (elapsed.count() <= msg.t_x)
        {
                continue;
        }
        else
        { 
            printf("实际t_x: %f s.\n",elapsed.count());
            break;
        }
    }
    printf("finish x !\n");
}

void module_displace_y(module_displacement* dis, chassis_ctrl::motion &msg) {
    printf("----> 执行y \n");
    printf("执行时间ty： %f\n",msg.t_y);
    auto start = std::chrono::steady_clock::now();
    while (true) {
        
        generate_square_wave(addr, GPIO_2, GPIO_3, FEQ, dis->y_move, dis->y_dir);
        auto end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed = end - start;
        if (elapsed.count() <= msg.t_y)
            continue;
        else
        { 
            printf("实际t_y: %f s.\n",elapsed.count());
            break;
        }

    }
    printf("finish y !\n");
}

void module_displace_z(module_displacement* dis, chassis_ctrl::motion &msg) {
    printf("执行时间tz： %f\n.",msg.t_z);
    auto start = std::chrono::steady_clock::now();
    while (true) {
        
        generate_square_wave(addr, GPIO_4, GPIO_5, FEQ, dis->z_move, dis->z_dir);
        auto end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed = end - start;
        if (elapsed.count() <= msg.t_z)
            continue;
        else
        { 
            printf("t_z: %f s.\n",elapsed.count());
            break;
        }
    }
    printf("finish z !\n");
}

chassis_ctrl::motion wt_dir( chassis_ctrl::motion &msg){
     int n = msg.p_index;
     if(msg.p_index == 0){ // 1
        msg.dir_x = 0; msg.dir_y = 0; msg.dir_z = 1; //初始化为 1
        msg.d_x = msg.data[0]; msg.d_y = msg.data[1]; msg.d_z = msg.data[2];    
        return msg;                                                                                   
    } else if (msg.p_index != 0 && msg.data[4*n] > msg.data[4*(n-1)] && msg.data[4*n+1] > msg.data[4*n-3] && msg.data[4*n+2] > msg.data[4*n-2]){ // 2
        msg.dir_x = msg.dir_y = msg.dir_z = 1;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
        return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] < msg.data[4*(n-1)] && msg.data[4*n+1] > msg.data[4*n-3] && msg.data[4*n+2] > msg.data[4*n-2]){ // 3
       msg.dir_x = 0; msg.dir_y = msg.dir_z = 1;
       msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
       return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] > msg.data[4*(n-1)] && msg.data[4*n+1] < msg.data[4*n-3] && msg.data[4*n+2] > msg.data[4*n-2]){ // 4
        msg.dir_x = 1; msg.dir_y = 0 ; msg.dir_z = 1;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]);
        return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] > msg.data[4*(n-1)] && msg.data[4*n+1] > msg.data[4*n-3] && msg.data[4*n+2] < msg.data[4*n-2]){ // 5
        msg.dir_x = 1; msg.dir_y = 1 ; msg.dir_z = 0;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
        return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] < msg.data[4*(n-1)] && msg.data[4*n+1] < msg.data[4*n-3] && msg.data[4*n+2] > msg.data[4*n-2]){ // 6
        msg.dir_x = msg.dir_y = 0; msg.dir_z = 1;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
        return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] > msg.data[4*(n-1)] && msg.data[4*n+1] < msg.data[4*n-3] && msg.data[4*n+2] < msg.data[4*n-2]){ // 7
        msg.dir_x = 1; msg.dir_y = 0; msg.dir_z = 0;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
        return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] < msg.data[4*(n-1)] && msg.data[4*n+1] > msg.data[4*n-3] && msg.data[4*n+2] < msg.data[4*n-2]){ // 8
        msg.dir_x = 0; msg.dir_y = 1; msg.dir_z = 0;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
        return msg;  
    } else if (msg.p_index != 0 && msg.data[4*n] < msg.data[4*(n-1)] && msg.data[4*n+1] < msg.data[4*n-3] && msg.data[4*n+2] < msg.data[4*n-2]){ // 9
        msg.dir_x = msg.dir_y = msg.dir_z = 0;
        msg.d_x = std::abs(msg.data[4*n] - msg.data[4*(n-1)]); msg.d_y = std::abs(msg.data[4*n+1] - msg.data[4*n-3]); msg.d_z = std::abs(msg.data[4*n+2] - msg.data[4*n-2]); 
        return msg;  
    }
   
}

chassis_ctrl::motion wt_time( chassis_ctrl::motion &msg){
    int n = msg.p_index;
     if(msg.p_index == 0){ // 1
        msg.t_x = float(msg.data[0]/msg.v_x); msg.t_y = float(msg.data[1]/msg.v_y); msg.t_z = float(msg.data[2]/msg.v_z);  
        return msg; 
     } else {
        //根据相对位置
        msg.t_x = float(std::abs(msg.data[4*n] - msg.data[4*n-4])/msg.v_x); msg.t_y = float(std::abs(msg.data[4*n+1] - msg.data[4*n-3])/msg.v_y); msg.t_z = float(std::abs(msg.data[4*n+2] - msg.data[4*n-2])/msg.v_z);
        return msg;
     }
}

void xyz_nodeCallback(const chassis_ctrl::motion &input_msg) {

    auto msg = input_msg;
    module_displacement dis;
    while (1){
        // 根据点之间相对位置 继续设置三轴方向，初始为 1
        // 现在执行第 n 个点，判断
        msg = wt_dir(msg);
        // 设置执行时间
        msg = wt_time(msg);
        printf("执行No. %d 个点： { %f,%f,%f },{ %d,%d,%d } \n.",msg.p_index,msg.t_x,msg.t_y,msg.t_z,msg.dir_x,msg.dir_y,msg.dir_z);

        dis.x_move = msg.d_x;// 
        dis.y_move = msg.d_y;//
        dis.z_move = msg.d_z;// 
        dis.z_theta = msg.data[4*msg.p_index+3]; // theta_z
        dis.x_dir = msg.dir_x; // 1：+x；0：-x
        dis.y_dir = msg.dir_y; // 1：+y；0：-y
        dis.z_dir = msg.dir_z; // 1: +z; 0: -z

        auto msg1 = msg; auto dis1 = dis;
        auto msg2 = msg; auto dis2 = dis;
        auto msg3 = msg; auto dis3 = dis;


        printf("xyz dist: %f,%f,%f\n.",msg.d_x,msg.d_y,msg.d_z);
        printf("xyz dir: %d,%d,%d\n.",msg.dir_x,msg.dir_y,msg.dir_z);
        printf("xyz cost: %f,%f,%f\n.",msg.t_x,msg.t_y,msg.t_z);
       

        std::thread thread1(module_displace_x, &dis1, std::ref(msg1));
        std::thread thread2(module_displace_y, &dis2, std::ref(msg2));
        // std::thread thread3(module_displace_z, &dis3, std::ref(msg3));

        if (int(msg.b_cybergear) == 0) {
            
            thread1.join();
            thread2.join();
        }
        
        printf("----> 不执行z\n");
        // module_displace_z(&dis3,msg3);
        // thread3.join();
            
        // }

            msg.p_index += 1;
            if (msg.p_index > 0)
                break;
    }
}

int main(int argc, char **argv) {
    setlocale(LC_ALL, "");

    ros::init(argc, argv, "xyz_node");
    ros::NodeHandle nh_;
    ROS_INFO("\033[1;32m----> xyz_node Started.\033[0m");
    ros::Subscriber xyz_sub = nh_.subscribe("/xyz_node/xyz_action", 10, &xyz_nodeCallback);

    ros::MultiThreadedSpinner spinner(3);
    spinner.spin();
    return 0;
}
