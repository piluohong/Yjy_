# (x,y,z,theta_z;....;....;)， 坐标值/z轴目标角度 （测试使用两个点）
float32[8] data  # mm

# 当前点索引
int32 p_index

# 定位每个目标时，三个方向的速度值, 根据电机给定
float32 v_x
float32 v_y
float32 v_z

# xyz执行量
float32 d_x
float32 d_y
float32 d_z

# xyz 执行时间, 用于响应截止
float32 t_x # unit: s
float32 t_y
float32 t_z

# xyz动作执行方向
int32 dir_x
int32 dir_y
int32 dir_z

# 判断xyz,b_cybergear动作执行完成
bool b_x
bool b_y
bool b_z
bool b_cybergear

# 判断钢筋绑扎完成
bool action_f
