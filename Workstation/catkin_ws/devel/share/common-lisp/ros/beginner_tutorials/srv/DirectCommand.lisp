; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude DirectCommand-request.msg.html

(cl:defclass <DirectCommand-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0))
)

(cl:defclass DirectCommand-request (<DirectCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DirectCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DirectCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<DirectCommand-request> is deprecated: use beginner_tutorials-srv:DirectCommand-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <DirectCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:command-val is deprecated.  Use beginner_tutorials-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DirectCommand-request>) ostream)
  "Serializes a message object of type '<DirectCommand-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DirectCommand-request>) istream)
  "Deserializes a message object of type '<DirectCommand-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DirectCommand-request>)))
  "Returns string type for a service object of type '<DirectCommand-request>"
  "beginner_tutorials/DirectCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DirectCommand-request)))
  "Returns string type for a service object of type 'DirectCommand-request"
  "beginner_tutorials/DirectCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DirectCommand-request>)))
  "Returns md5sum for a message object of type '<DirectCommand-request>"
  "9e9df97ee294b65ca1135b52cef74a60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DirectCommand-request)))
  "Returns md5sum for a message object of type 'DirectCommand-request"
  "9e9df97ee294b65ca1135b52cef74a60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DirectCommand-request>)))
  "Returns full string definition for message of type '<DirectCommand-request>"
  (cl:format cl:nil "int64 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DirectCommand-request)))
  "Returns full string definition for message of type 'DirectCommand-request"
  (cl:format cl:nil "int64 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DirectCommand-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DirectCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DirectCommand-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude DirectCommand-response.msg.html

(cl:defclass <DirectCommand-response> (roslisp-msg-protocol:ros-message)
  ((responseToCommand
    :reader responseToCommand
    :initarg :responseToCommand
    :type cl:integer
    :initform 0))
)

(cl:defclass DirectCommand-response (<DirectCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DirectCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DirectCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<DirectCommand-response> is deprecated: use beginner_tutorials-srv:DirectCommand-response instead.")))

(cl:ensure-generic-function 'responseToCommand-val :lambda-list '(m))
(cl:defmethod responseToCommand-val ((m <DirectCommand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:responseToCommand-val is deprecated.  Use beginner_tutorials-srv:responseToCommand instead.")
  (responseToCommand m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DirectCommand-response>) ostream)
  "Serializes a message object of type '<DirectCommand-response>"
  (cl:let* ((signed (cl:slot-value msg 'responseToCommand)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DirectCommand-response>) istream)
  "Deserializes a message object of type '<DirectCommand-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'responseToCommand) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DirectCommand-response>)))
  "Returns string type for a service object of type '<DirectCommand-response>"
  "beginner_tutorials/DirectCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DirectCommand-response)))
  "Returns string type for a service object of type 'DirectCommand-response"
  "beginner_tutorials/DirectCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DirectCommand-response>)))
  "Returns md5sum for a message object of type '<DirectCommand-response>"
  "9e9df97ee294b65ca1135b52cef74a60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DirectCommand-response)))
  "Returns md5sum for a message object of type 'DirectCommand-response"
  "9e9df97ee294b65ca1135b52cef74a60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DirectCommand-response>)))
  "Returns full string definition for message of type '<DirectCommand-response>"
  (cl:format cl:nil "int64 responseToCommand~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DirectCommand-response)))
  "Returns full string definition for message of type 'DirectCommand-response"
  (cl:format cl:nil "int64 responseToCommand~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DirectCommand-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DirectCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DirectCommand-response
    (cl:cons ':responseToCommand (responseToCommand msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DirectCommand)))
  'DirectCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DirectCommand)))
  'DirectCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DirectCommand)))
  "Returns string type for a service object of type '<DirectCommand>"
  "beginner_tutorials/DirectCommand")