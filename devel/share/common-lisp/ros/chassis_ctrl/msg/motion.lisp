; Auto-generated. Do not edit!


(cl:in-package chassis_ctrl-msg)


;//! \htmlinclude motion.msg.html

(cl:defclass <motion> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (dist_x
    :reader dist_x
    :initarg :dist_x
    :type cl:float
    :initform 0.0)
   (dist_y
    :reader dist_y
    :initarg :dist_y
    :type cl:float
    :initform 0.0)
   (dist_z
    :reader dist_z
    :initarg :dist_z
    :type cl:float
    :initform 0.0)
   (dir_x
    :reader dir_x
    :initarg :dir_x
    :type cl:integer
    :initform 0)
   (dir_y
    :reader dir_y
    :initarg :dir_y
    :type cl:integer
    :initform 0)
   (dir_z
    :reader dir_z
    :initarg :dir_z
    :type cl:integer
    :initform 0)
   (b_x
    :reader b_x
    :initarg :b_x
    :type cl:boolean
    :initform cl:nil)
   (b_y
    :reader b_y
    :initarg :b_y
    :type cl:boolean
    :initform cl:nil)
   (b_z
    :reader b_z
    :initarg :b_z
    :type cl:boolean
    :initform cl:nil)
   (b_cybergear
    :reader b_cybergear
    :initarg :b_cybergear
    :type cl:boolean
    :initform cl:nil)
   (action_f
    :reader action_f
    :initarg :action_f
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass motion (<motion>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motion>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motion)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chassis_ctrl-msg:<motion> is deprecated: use chassis_ctrl-msg:motion instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:data-val is deprecated.  Use chassis_ctrl-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'dist_x-val :lambda-list '(m))
(cl:defmethod dist_x-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:dist_x-val is deprecated.  Use chassis_ctrl-msg:dist_x instead.")
  (dist_x m))

(cl:ensure-generic-function 'dist_y-val :lambda-list '(m))
(cl:defmethod dist_y-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:dist_y-val is deprecated.  Use chassis_ctrl-msg:dist_y instead.")
  (dist_y m))

(cl:ensure-generic-function 'dist_z-val :lambda-list '(m))
(cl:defmethod dist_z-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:dist_z-val is deprecated.  Use chassis_ctrl-msg:dist_z instead.")
  (dist_z m))

(cl:ensure-generic-function 'dir_x-val :lambda-list '(m))
(cl:defmethod dir_x-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:dir_x-val is deprecated.  Use chassis_ctrl-msg:dir_x instead.")
  (dir_x m))

(cl:ensure-generic-function 'dir_y-val :lambda-list '(m))
(cl:defmethod dir_y-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:dir_y-val is deprecated.  Use chassis_ctrl-msg:dir_y instead.")
  (dir_y m))

(cl:ensure-generic-function 'dir_z-val :lambda-list '(m))
(cl:defmethod dir_z-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:dir_z-val is deprecated.  Use chassis_ctrl-msg:dir_z instead.")
  (dir_z m))

(cl:ensure-generic-function 'b_x-val :lambda-list '(m))
(cl:defmethod b_x-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:b_x-val is deprecated.  Use chassis_ctrl-msg:b_x instead.")
  (b_x m))

(cl:ensure-generic-function 'b_y-val :lambda-list '(m))
(cl:defmethod b_y-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:b_y-val is deprecated.  Use chassis_ctrl-msg:b_y instead.")
  (b_y m))

(cl:ensure-generic-function 'b_z-val :lambda-list '(m))
(cl:defmethod b_z-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:b_z-val is deprecated.  Use chassis_ctrl-msg:b_z instead.")
  (b_z m))

(cl:ensure-generic-function 'b_cybergear-val :lambda-list '(m))
(cl:defmethod b_cybergear-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:b_cybergear-val is deprecated.  Use chassis_ctrl-msg:b_cybergear instead.")
  (b_cybergear m))

(cl:ensure-generic-function 'action_f-val :lambda-list '(m))
(cl:defmethod action_f-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:action_f-val is deprecated.  Use chassis_ctrl-msg:action_f instead.")
  (action_f m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<motion>)))
    "Constants for message type '<motion>"
  '((:ROWS . 4)
    (:COLS . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'motion)))
    "Constants for message type 'motion"
  '((:ROWS . 4)
    (:COLS . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motion>) ostream)
  "Serializes a message object of type '<motion>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'data))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'dir_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dir_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dir_z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'b_x) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'b_y) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'b_z) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'b_cybergear) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'action_f) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motion>) istream)
  "Deserializes a message object of type '<motion>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dir_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dir_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dir_z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'b_x) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'b_y) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'b_z) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'b_cybergear) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'action_f) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motion>)))
  "Returns string type for a message object of type '<motion>"
  "chassis_ctrl/motion")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motion)))
  "Returns string type for a message object of type 'motion"
  "chassis_ctrl/motion")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motion>)))
  "Returns md5sum for a message object of type '<motion>"
  "523376a3a3e7158b7be3bb165bd17ef2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motion)))
  "Returns md5sum for a message object of type 'motion"
  "523376a3a3e7158b7be3bb165bd17ef2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motion>)))
  "Returns full string definition for message of type '<motion>"
  (cl:format cl:nil "# 坐标(x,y,z,theta_z)，4行1列~%float32[] data~%int32 rows = 4~%int32 cols = 1~%~%# xyz动作执行量~%float32 dist_x # unit: mm~%float32 dist_y~%float32 dist_z~%~%# xyz动作执行方向~%int32 dir_x~%int32 dir_y~%int32 dir_z~%~%# 判断xyz,b_cybergear动作执行完成~%bool b_x~%bool b_y~%bool b_z~%bool b_cybergear~%~%# 判断钢筋绑扎完成~%bool action_f~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motion)))
  "Returns full string definition for message of type 'motion"
  (cl:format cl:nil "# 坐标(x,y,z,theta_z)，4行1列~%float32[] data~%int32 rows = 4~%int32 cols = 1~%~%# xyz动作执行量~%float32 dist_x # unit: mm~%float32 dist_y~%float32 dist_z~%~%# xyz动作执行方向~%int32 dir_x~%int32 dir_y~%int32 dir_z~%~%# 判断xyz,b_cybergear动作执行完成~%bool b_x~%bool b_y~%bool b_z~%bool b_cybergear~%~%# 判断钢筋绑扎完成~%bool action_f~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motion>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     4
     4
     4
     4
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motion>))
  "Converts a ROS message object to a list"
  (cl:list 'motion
    (cl:cons ':data (data msg))
    (cl:cons ':dist_x (dist_x msg))
    (cl:cons ':dist_y (dist_y msg))
    (cl:cons ':dist_z (dist_z msg))
    (cl:cons ':dir_x (dir_x msg))
    (cl:cons ':dir_y (dir_y msg))
    (cl:cons ':dir_z (dir_z msg))
    (cl:cons ':b_x (b_x msg))
    (cl:cons ':b_y (b_y msg))
    (cl:cons ':b_z (b_z msg))
    (cl:cons ':b_cybergear (b_cybergear msg))
    (cl:cons ':action_f (action_f msg))
))
