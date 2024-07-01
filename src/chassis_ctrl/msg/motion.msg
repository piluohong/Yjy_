# 坐标(x,y,z,theta_z)，4行1列
float32[] data
int32 rows=4
int32 cols=1

# xyz动作执行量
float32 dist_x # unit: mm
float32 dist_y
float32 dist_z

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
