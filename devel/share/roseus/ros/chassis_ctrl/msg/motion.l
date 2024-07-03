;; Auto-generated. Do not edit!


(when (boundp 'chassis_ctrl::motion)
  (if (not (find-package "CHASSIS_CTRL"))
    (make-package "CHASSIS_CTRL"))
  (shadow 'motion (find-package "CHASSIS_CTRL")))
(unless (find-package "CHASSIS_CTRL::MOTION")
  (make-package "CHASSIS_CTRL::MOTION"))

(in-package "ROS")
;;//! \htmlinclude motion.msg.html


(defclass chassis_ctrl::motion
  :super ros::object
  :slots (_data _p_index _v_x _v_y _v_z _d_x _d_y _d_z _t_x _t_y _t_z _dir_x _dir_y _dir_z _b_x _b_y _b_z _b_cybergear _action_f ))

(defmethod chassis_ctrl::motion
  (:init
   (&key
    ((:data __data) (make-array 8 :initial-element 0.0 :element-type :float))
    ((:p_index __p_index) 0)
    ((:v_x __v_x) 0.0)
    ((:v_y __v_y) 0.0)
    ((:v_z __v_z) 0.0)
    ((:d_x __d_x) 0.0)
    ((:d_y __d_y) 0.0)
    ((:d_z __d_z) 0.0)
    ((:t_x __t_x) 0.0)
    ((:t_y __t_y) 0.0)
    ((:t_z __t_z) 0.0)
    ((:dir_x __dir_x) 0)
    ((:dir_y __dir_y) 0)
    ((:dir_z __dir_z) 0)
    ((:b_x __b_x) nil)
    ((:b_y __b_y) nil)
    ((:b_z __b_z) nil)
    ((:b_cybergear __b_cybergear) nil)
    ((:action_f __action_f) nil)
    )
   (send-super :init)
   (setq _data __data)
   (setq _p_index (round __p_index))
   (setq _v_x (float __v_x))
   (setq _v_y (float __v_y))
   (setq _v_z (float __v_z))
   (setq _d_x (float __d_x))
   (setq _d_y (float __d_y))
   (setq _d_z (float __d_z))
   (setq _t_x (float __t_x))
   (setq _t_y (float __t_y))
   (setq _t_z (float __t_z))
   (setq _dir_x (round __dir_x))
   (setq _dir_y (round __dir_y))
   (setq _dir_z (round __dir_z))
   (setq _b_x __b_x)
   (setq _b_y __b_y)
   (setq _b_z __b_z)
   (setq _b_cybergear __b_cybergear)
   (setq _action_f __action_f)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:p_index
   (&optional __p_index)
   (if __p_index (setq _p_index __p_index)) _p_index)
  (:v_x
   (&optional __v_x)
   (if __v_x (setq _v_x __v_x)) _v_x)
  (:v_y
   (&optional __v_y)
   (if __v_y (setq _v_y __v_y)) _v_y)
  (:v_z
   (&optional __v_z)
   (if __v_z (setq _v_z __v_z)) _v_z)
  (:d_x
   (&optional __d_x)
   (if __d_x (setq _d_x __d_x)) _d_x)
  (:d_y
   (&optional __d_y)
   (if __d_y (setq _d_y __d_y)) _d_y)
  (:d_z
   (&optional __d_z)
   (if __d_z (setq _d_z __d_z)) _d_z)
  (:t_x
   (&optional __t_x)
   (if __t_x (setq _t_x __t_x)) _t_x)
  (:t_y
   (&optional __t_y)
   (if __t_y (setq _t_y __t_y)) _t_y)
  (:t_z
   (&optional __t_z)
   (if __t_z (setq _t_z __t_z)) _t_z)
  (:dir_x
   (&optional __dir_x)
   (if __dir_x (setq _dir_x __dir_x)) _dir_x)
  (:dir_y
   (&optional __dir_y)
   (if __dir_y (setq _dir_y __dir_y)) _dir_y)
  (:dir_z
   (&optional __dir_z)
   (if __dir_z (setq _dir_z __dir_z)) _dir_z)
  (:b_x
   (&optional (__b_x :null))
   (if (not (eq __b_x :null)) (setq _b_x __b_x)) _b_x)
  (:b_y
   (&optional (__b_y :null))
   (if (not (eq __b_y :null)) (setq _b_y __b_y)) _b_y)
  (:b_z
   (&optional (__b_z :null))
   (if (not (eq __b_z :null)) (setq _b_z __b_z)) _b_z)
  (:b_cybergear
   (&optional (__b_cybergear :null))
   (if (not (eq __b_cybergear :null)) (setq _b_cybergear __b_cybergear)) _b_cybergear)
  (:action_f
   (&optional (__action_f :null))
   (if (not (eq __action_f :null)) (setq _action_f __action_f)) _action_f)
  (:serialization-length
   ()
   (+
    ;; float32[8] _data
    (* 4    8)
    ;; int32 _p_index
    4
    ;; float32 _v_x
    4
    ;; float32 _v_y
    4
    ;; float32 _v_z
    4
    ;; float32 _d_x
    4
    ;; float32 _d_y
    4
    ;; float32 _d_z
    4
    ;; float32 _t_x
    4
    ;; float32 _t_y
    4
    ;; float32 _t_z
    4
    ;; int32 _dir_x
    4
    ;; int32 _dir_y
    4
    ;; int32 _dir_z
    4
    ;; bool _b_x
    1
    ;; bool _b_y
    1
    ;; bool _b_z
    1
    ;; bool _b_cybergear
    1
    ;; bool _action_f
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[8] _data
     (dotimes (i 8)
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _p_index
       (write-long _p_index s)
     ;; float32 _v_x
       (sys::poke _v_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_y
       (sys::poke _v_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_z
       (sys::poke _v_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d_x
       (sys::poke _d_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d_y
       (sys::poke _d_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d_z
       (sys::poke _d_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _t_x
       (sys::poke _t_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _t_y
       (sys::poke _t_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _t_z
       (sys::poke _t_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _dir_x
       (write-long _dir_x s)
     ;; int32 _dir_y
       (write-long _dir_y s)
     ;; int32 _dir_z
       (write-long _dir_z s)
     ;; bool _b_x
       (if _b_x (write-byte -1 s) (write-byte 0 s))
     ;; bool _b_y
       (if _b_y (write-byte -1 s) (write-byte 0 s))
     ;; bool _b_z
       (if _b_z (write-byte -1 s) (write-byte 0 s))
     ;; bool _b_cybergear
       (if _b_cybergear (write-byte -1 s) (write-byte 0 s))
     ;; bool _action_f
       (if _action_f (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[8] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; int32 _p_index
     (setq _p_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _v_x
     (setq _v_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_y
     (setq _v_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_z
     (setq _v_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d_x
     (setq _d_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d_y
     (setq _d_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d_z
     (setq _d_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _t_x
     (setq _t_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _t_y
     (setq _t_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _t_z
     (setq _t_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _dir_x
     (setq _dir_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _dir_y
     (setq _dir_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _dir_z
     (setq _dir_z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _b_x
     (setq _b_x (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _b_y
     (setq _b_y (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _b_z
     (setq _b_z (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _b_cybergear
     (setq _b_cybergear (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _action_f
     (setq _action_f (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get chassis_ctrl::motion :md5sum-) "09cf865b2244b478628aef6da36bc73b")
(setf (get chassis_ctrl::motion :datatype-) "chassis_ctrl/motion")
(setf (get chassis_ctrl::motion :definition-)
      "# (x,y,z,theta_z;....;....;)， 坐标值/z轴目标角度 （测试使用两个点）
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

")



(provide :chassis_ctrl/motion "09cf865b2244b478628aef6da36bc73b")


