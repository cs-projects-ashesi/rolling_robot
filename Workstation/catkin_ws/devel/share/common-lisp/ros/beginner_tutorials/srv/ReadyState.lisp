; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude ReadyState-request.msg.html

(cl:defclass <ReadyState-request> (roslisp-msg-protocol:ros-message)
  ((readyState
    :reader readyState
    :initarg :readyState
    :type cl:integer
    :initform 0))
)

(cl:defclass ReadyState-request (<ReadyState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadyState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadyState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<ReadyState-request> is deprecated: use beginner_tutorials-srv:ReadyState-request instead.")))

(cl:ensure-generic-function 'readyState-val :lambda-list '(m))
(cl:defmethod readyState-val ((m <ReadyState-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:readyState-val is deprecated.  Use beginner_tutorials-srv:readyState instead.")
  (readyState m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadyState-request>) ostream)
  "Serializes a message object of type '<ReadyState-request>"
  (cl:let* ((signed (cl:slot-value msg 'readyState)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadyState-request>) istream)
  "Deserializes a message object of type '<ReadyState-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'readyState) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadyState-request>)))
  "Returns string type for a service object of type '<ReadyState-request>"
  "beginner_tutorials/ReadyStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadyState-request)))
  "Returns string type for a service object of type 'ReadyState-request"
  "beginner_tutorials/ReadyStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadyState-request>)))
  "Returns md5sum for a message object of type '<ReadyState-request>"
  "093c79086d3f8c14f468bc34eaeb565c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadyState-request)))
  "Returns md5sum for a message object of type 'ReadyState-request"
  "093c79086d3f8c14f468bc34eaeb565c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadyState-request>)))
  "Returns full string definition for message of type '<ReadyState-request>"
  (cl:format cl:nil "int64 readyState~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadyState-request)))
  "Returns full string definition for message of type 'ReadyState-request"
  (cl:format cl:nil "int64 readyState~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadyState-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadyState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadyState-request
    (cl:cons ':readyState (readyState msg))
))
;//! \htmlinclude ReadyState-response.msg.html

(cl:defclass <ReadyState-response> (roslisp-msg-protocol:ros-message)
  ((ready
    :reader ready
    :initarg :ready
    :type cl:integer
    :initform 0))
)

(cl:defclass ReadyState-response (<ReadyState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadyState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadyState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<ReadyState-response> is deprecated: use beginner_tutorials-srv:ReadyState-response instead.")))

(cl:ensure-generic-function 'ready-val :lambda-list '(m))
(cl:defmethod ready-val ((m <ReadyState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:ready-val is deprecated.  Use beginner_tutorials-srv:ready instead.")
  (ready m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadyState-response>) ostream)
  "Serializes a message object of type '<ReadyState-response>"
  (cl:let* ((signed (cl:slot-value msg 'ready)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadyState-response>) istream)
  "Deserializes a message object of type '<ReadyState-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ready) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadyState-response>)))
  "Returns string type for a service object of type '<ReadyState-response>"
  "beginner_tutorials/ReadyStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadyState-response)))
  "Returns string type for a service object of type 'ReadyState-response"
  "beginner_tutorials/ReadyStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadyState-response>)))
  "Returns md5sum for a message object of type '<ReadyState-response>"
  "093c79086d3f8c14f468bc34eaeb565c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadyState-response)))
  "Returns md5sum for a message object of type 'ReadyState-response"
  "093c79086d3f8c14f468bc34eaeb565c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadyState-response>)))
  "Returns full string definition for message of type '<ReadyState-response>"
  (cl:format cl:nil "int64 ready~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadyState-response)))
  "Returns full string definition for message of type 'ReadyState-response"
  (cl:format cl:nil "int64 ready~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadyState-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadyState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadyState-response
    (cl:cons ':ready (ready msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadyState)))
  'ReadyState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadyState)))
  'ReadyState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadyState)))
  "Returns string type for a service object of type '<ReadyState>"
  "beginner_tutorials/ReadyState")