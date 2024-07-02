# (v_x,v_y,v_z,theta_z)，4行1列 速度值/z轴目标角度
float32[] data  # mm / s
int32 rows = 4
int32 cols = 1

# xyz 执行时间
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
