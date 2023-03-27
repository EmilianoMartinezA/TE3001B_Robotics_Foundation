; Auto-generated. Do not edit!


(cl:in-package basic_comms-msg)


;//! \htmlinclude signal_msg.msg.html

(cl:defclass <signal_msg> (roslisp-msg-protocol:ros-message)
  ((time_x
    :reader time_x
    :initarg :time_x
    :type cl:float
    :initform 0.0)
   (signal_y
    :reader signal_y
    :initarg :signal_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass signal_msg (<signal_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <signal_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'signal_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name basic_comms-msg:<signal_msg> is deprecated: use basic_comms-msg:signal_msg instead.")))

(cl:ensure-generic-function 'time_x-val :lambda-list '(m))
(cl:defmethod time_x-val ((m <signal_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_comms-msg:time_x-val is deprecated.  Use basic_comms-msg:time_x instead.")
  (time_x m))

(cl:ensure-generic-function 'signal_y-val :lambda-list '(m))
(cl:defmethod signal_y-val ((m <signal_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_comms-msg:signal_y-val is deprecated.  Use basic_comms-msg:signal_y instead.")
  (signal_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <signal_msg>) ostream)
  "Serializes a message object of type '<signal_msg>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'signal_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <signal_msg>) istream)
  "Deserializes a message object of type '<signal_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'signal_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<signal_msg>)))
  "Returns string type for a message object of type '<signal_msg>"
  "basic_comms/signal_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'signal_msg)))
  "Returns string type for a message object of type 'signal_msg"
  "basic_comms/signal_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<signal_msg>)))
  "Returns md5sum for a message object of type '<signal_msg>"
  "00f39935c5dcc9cf05628912678eba28")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'signal_msg)))
  "Returns md5sum for a message object of type 'signal_msg"
  "00f39935c5dcc9cf05628912678eba28")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<signal_msg>)))
  "Returns full string definition for message of type '<signal_msg>"
  (cl:format cl:nil "float64 time_x~%float32 signal_y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'signal_msg)))
  "Returns full string definition for message of type 'signal_msg"
  (cl:format cl:nil "float64 time_x~%float32 signal_y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <signal_msg>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <signal_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'signal_msg
    (cl:cons ':time_x (time_x msg))
    (cl:cons ':signal_y (signal_y msg))
))
