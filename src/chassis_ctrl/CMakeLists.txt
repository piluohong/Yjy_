cmake_minimum_required(VERSION 3.0.2)
project(chassis_ctrl)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  motion.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)


# 节点构建选项，配置可执行文件
add_executable(joy src/joy.cpp)
# 节点构建选项，配置目标链接库
target_link_libraries(joy
  ${catkin_LIBRARIES}
)

add_executable(gpio src/gpio.cpp)
# 节点构建选项，配置目标链接库
target_link_libraries(gpio
  ${catkin_LIBRARIES}
)

add_executable(xyz src/test.cpp)
# 节点构建选项，配置目标链接库
target_link_libraries(xyz
  ${catkin_LIBRARIES}
)


