;; Auto-generated. Do not edit!


(when (boundp 'chassis_ctrl::motion)
  (if (not (find-package "CHASSIS_CTRL"))
    (make-package "CHASSIS_CTRL"))
  (shadow 'motion (find-package "CHASSIS_CTRL")))
(unless (find-package "CHASSIS_CTRL::MOTION")
  (make-package "CHASSIS_CTRL::MOTION"))

(in-package "ROS")
;;//! \htmlinclude motion.msg.html


(intern "*ROWS*" (find-package "CHASSIS_CTRL::MOTION"))
(shadow '*ROWS* (find-package "CHASSIS_CTRL::MOTION"))
(defconstant chassis_ctrl::motion::*ROWS* 4)
(intern "*COLS*" (find-package "CHASSIS_CTRL::MOTION"))
(shadow '*COLS* (find-package "CHASSIS_CTRL::MOTION"))
(defconstant chassis_ctrl::motion::*COLS* 1)

(defun chassis_ctrl::motion-to-symbol (const)
  (cond
        ((= const 4) 'chassis_ctrl::motion::*rows*)
        ((= const 1) 'chassis_ctrl::motion::*cols*)
        (t nil)))

(defclass chassis_ctrl::motion
  :super ros::object
  :slots (_data _dist_x _dist_y _dist_z _dir_x _dir_y _dir_z _b_x _b_y _b_z _b_cybergear _action_f ))

(defmethod chassis_ctrl::motion
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:dist_x __dist_x) 0.0)
    ((:dist_y __dist_y) 0.0)
    ((:dist_z __dist_z) 0.0)
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
   (setq _dist_x (float __dist_x))
   (setq _dist_y (float __dist_y))
   (setq _dist_z (float __dist_z))
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
  (:dist_x
   (&optional __dist_x)
   (if __dist_x (setq _dist_x __dist_x)) _dist_x)
  (:dist_y
   (&optional __dist_y)
   (if __dist_y (setq _dist_y __dist_y)) _dist_y)
  (:dist_z
   (&optional __dist_z)
   (if __dist_z (setq _dist_z __dist_z)) _dist_z)
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
    ;; float32[] _data
    (* 4    (length _data)) 4
    ;; float32 _dist_x
    4
    ;; float32 _dist_y
    4
    ;; float32 _dist_z
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
     ;; float32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _dist_x
       (sys::poke _dist_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dist_y
       (sys::poke _dist_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dist_z
       (sys::poke _dist_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _dist_x
     (setq _dist_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dist_y
     (setq _dist_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dist_z
     (setq _dist_z (sys::peek buf ptr- :float)) (incf ptr- 4)
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

(setf (get chassis_ctrl::motion :md5sum-) "523376a3a3e7158b7be3bb165bd17ef2")
(setf (get chassis_ctrl::motion :datatype-) "chassis_ctrl/motion")
(setf (get chassis_ctrl::motion :definition-)
      "# 坐标(x,y,z,theta_z)，4行1列
float32[] data
int32 rows = 4
int32 cols = 1

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

")



(provide :chassis_ctrl/motion "523376a3a3e7158b7be3bb165bd17ef2")


