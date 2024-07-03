; Auto-generated. Do not edit!


(cl:in-package chassis_ctrl-msg)


;//! \htmlinclude motion.msg.html

(cl:defclass <motion> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 8 :element-type 'cl:float :initial-element 0.0))
   (p_index
    :reader p_index
    :initarg :p_index
    :type cl:integer
    :initform 0)
   (v_x
    :reader v_x
    :initarg :v_x
    :type cl:float
    :initform 0.0)
   (v_y
    :reader v_y
    :initarg :v_y
    :type cl:float
    :initform 0.0)
   (v_z
    :reader v_z
    :initarg :v_z
    :type cl:float
    :initform 0.0)
   (d_x
    :reader d_x
    :initarg :d_x
    :type cl:float
    :initform 0.0)
   (d_y
    :reader d_y
    :initarg :d_y
    :type cl:float
    :initform 0.0)
   (d_z
    :reader d_z
    :initarg :d_z
    :type cl:float
    :initform 0.0)
   (t_x
    :reader t_x
    :initarg :t_x
    :type cl:float
    :initform 0.0)
   (t_y
    :reader t_y
    :initarg :t_y
    :type cl:float
    :initform 0.0)
   (t_z
    :reader t_z
    :initarg :t_z
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

(cl:ensure-generic-function 'p_index-val :lambda-list '(m))
(cl:defmethod p_index-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:p_index-val is deprecated.  Use chassis_ctrl-msg:p_index instead.")
  (p_index m))

(cl:ensure-generic-function 'v_x-val :lambda-list '(m))
(cl:defmethod v_x-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:v_x-val is deprecated.  Use chassis_ctrl-msg:v_x instead.")
  (v_x m))

(cl:ensure-generic-function 'v_y-val :lambda-list '(m))
(cl:defmethod v_y-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:v_y-val is deprecated.  Use chassis_ctrl-msg:v_y instead.")
  (v_y m))

(cl:ensure-generic-function 'v_z-val :lambda-list '(m))
(cl:defmethod v_z-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:v_z-val is deprecated.  Use chassis_ctrl-msg:v_z instead.")
  (v_z m))

(cl:ensure-generic-function 'd_x-val :lambda-list '(m))
(cl:defmethod d_x-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:d_x-val is deprecated.  Use chassis_ctrl-msg:d_x instead.")
  (d_x m))

(cl:ensure-generic-function 'd_y-val :lambda-list '(m))
(cl:defmethod d_y-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:d_y-val is deprecated.  Use chassis_ctrl-msg:d_y instead.")
  (d_y m))

(cl:ensure-generic-function 'd_z-val :lambda-list '(m))
(cl:defmethod d_z-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:d_z-val is deprecated.  Use chassis_ctrl-msg:d_z instead.")
  (d_z m))

(cl:ensure-generic-function 't_x-val :lambda-list '(m))
(cl:defmethod t_x-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:t_x-val is deprecated.  Use chassis_ctrl-msg:t_x instead.")
  (t_x m))

(cl:ensure-generic-function 't_y-val :lambda-list '(m))
(cl:defmethod t_y-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:t_y-val is deprecated.  Use chassis_ctrl-msg:t_y instead.")
  (t_y m))

(cl:ensure-generic-function 't_z-val :lambda-list '(m))
(cl:defmethod t_z-val ((m <motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chassis_ctrl-msg:t_z-val is deprecated.  Use chassis_ctrl-msg:t_z instead.")
  (t_z m))

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
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motion>) ostream)
  "Serializes a message object of type '<motion>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'data))
  (cl:let* ((signed (cl:slot-value msg 'p_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'd_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'd_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'd_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 't_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 't_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 't_z))))
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
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 8)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'p_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 't_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 't_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 't_z) (roslisp-utils:decode-single-float-bits bits)))
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
  "09cf865b2244b478628aef6da36bc73b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motion)))
  "Returns md5sum for a message object of type 'motion"
  "09cf865b2244b478628aef6da36bc73b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motion>)))
  "Returns full string definition for message of type '<motion>"
  (cl:format cl:nil "# (x,y,z,theta_z;....;....;)， 坐标值/z轴目标角度 （测试使用两个点）~%float32[8] data  # mm~%~%# 当前点索引~%int32 p_index~%~%# 定位每个目标时，三个方向的速度值, 根据电机给定~%float32 v_x~%float32 v_y~%float32 v_z~%~%# xyz执行量~%float32 d_x~%float32 d_y~%float32 d_z~%~%# xyz 执行时间, 用于响应截止~%float32 t_x # unit: s~%float32 t_y~%float32 t_z~%~%# xyz动作执行方向~%int32 dir_x~%int32 dir_y~%int32 dir_z~%~%# 判断xyz,b_cybergear动作执行完成~%bool b_x~%bool b_y~%bool b_z~%bool b_cybergear~%~%# 判断钢筋绑扎完成~%bool action_f~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motion)))
  "Returns full string definition for message of type 'motion"
  (cl:format cl:nil "# (x,y,z,theta_z;....;....;)， 坐标值/z轴目标角度 （测试使用两个点）~%float32[8] data  # mm~%~%# 当前点索引~%int32 p_index~%~%# 定位每个目标时，三个方向的速度值, 根据电机给定~%float32 v_x~%float32 v_y~%float32 v_z~%~%# xyz执行量~%float32 d_x~%float32 d_y~%float32 d_z~%~%# xyz 执行时间, 用于响应截止~%float32 t_x # unit: s~%float32 t_y~%float32 t_z~%~%# xyz动作执行方向~%int32 dir_x~%int32 dir_y~%int32 dir_z~%~%# 判断xyz,b_cybergear动作执行完成~%bool b_x~%bool b_y~%bool b_z~%bool b_cybergear~%~%# 判断钢筋绑扎完成~%bool action_f~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motion>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     4
     4
     4
     4
     4
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
    (cl:cons ':p_index (p_index msg))
    (cl:cons ':v_x (v_x msg))
    (cl:cons ':v_y (v_y msg))
    (cl:cons ':v_z (v_z msg))
    (cl:cons ':d_x (d_x msg))
    (cl:cons ':d_y (d_y msg))
    (cl:cons ':d_z (d_z msg))
    (cl:cons ':t_x (t_x msg))
    (cl:cons ':t_y (t_y msg))
    (cl:cons ':t_z (t_z msg))
    (cl:cons ':dir_x (dir_x msg))
    (cl:cons ':dir_y (dir_y msg))
    (cl:cons ':dir_z (dir_z msg))
    (cl:cons ':b_x (b_x msg))
    (cl:cons ':b_y (b_y msg))
    (cl:cons ':b_z (b_z msg))
    (cl:cons ':b_cybergear (b_cybergear msg))
    (cl:cons ':action_f (action_f msg))
))
