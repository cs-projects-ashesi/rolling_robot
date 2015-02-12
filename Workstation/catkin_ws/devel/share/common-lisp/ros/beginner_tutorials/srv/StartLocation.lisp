; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude StartLocation-request.msg.html

(cl:defclass <StartLocation-request> (roslisp-msg-protocol:ros-message)
  ((where1
    :reader where1
    :initarg :where1
    :type cl:integer
    :initform 0)
   (where2
    :reader where2
    :initarg :where2
    :type cl:integer
    :initform 0))
)

(cl:defclass StartLocation-request (<StartLocation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartLocation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartLocation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<StartLocation-request> is deprecated: use beginner_tutorials-srv:StartLocation-request instead.")))

(cl:ensure-generic-function 'where1-val :lambda-list '(m))
(cl:defmethod where1-val ((m <StartLocation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:where1-val is deprecated.  Use beginner_tutorials-srv:where1 instead.")
  (where1 m))

(cl:ensure-generic-function 'where2-val :lambda-list '(m))
(cl:defmethod where2-val ((m <StartLocation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:where2-val is deprecated.  Use beginner_tutorials-srv:where2 instead.")
  (where2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartLocation-request>) ostream)
  "Serializes a message object of type '<StartLocation-request>"
  (cl:let* ((signed (cl:slot-value msg 'where1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'where2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartLocation-request>) istream)
  "Deserializes a message object of type '<StartLocation-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'where1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'where2) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartLocation-request>)))
  "Returns string type for a service object of type '<StartLocation-request>"
  "beginner_tutorials/StartLocationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartLocation-request)))
  "Returns string type for a service object of type 'StartLocation-request"
  "beginner_tutorials/StartLocationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartLocation-request>)))
  "Returns md5sum for a message object of type '<StartLocation-request>"
  "d6307ff24f7891bc5f677dc387c942bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartLocation-request)))
  "Returns md5sum for a message object of type 'StartLocation-request"
  "d6307ff24f7891bc5f677dc387c942bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartLocation-request>)))
  "Returns full string definition for message of type '<StartLocation-request>"
  (cl:format cl:nil "int64 where1~%int64 where2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartLocation-request)))
  "Returns full string definition for message of type 'StartLocation-request"
  (cl:format cl:nil "int64 where1~%int64 where2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartLocation-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartLocation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StartLocation-request
    (cl:cons ':where1 (where1 msg))
    (cl:cons ':where2 (where2 msg))
))
;//! \htmlinclude StartLocation-response.msg.html

(cl:defclass <StartLocation-response> (roslisp-msg-protocol:ros-message)
  ((here
    :reader here
    :initarg :here
    :type cl:integer
    :initform 0))
)

(cl:defclass StartLocation-response (<StartLocation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartLocation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartLocation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<StartLocation-response> is deprecated: use beginner_tutorials-srv:StartLocation-response instead.")))

(cl:ensure-generic-function 'here-val :lambda-list '(m))
(cl:defmethod here-val ((m <StartLocation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:here-val is deprecated.  Use beginner_tutorials-srv:here instead.")
  (here m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartLocation-response>) ostream)
  "Serializes a message object of type '<StartLocation-response>"
  (cl:let* ((signed (cl:slot-value msg 'here)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartLocation-response>) istream)
  "Deserializes a message object of type '<StartLocation-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'here) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartLocation-response>)))
  "Returns string type for a service object of type '<StartLocation-response>"
  "beginner_tutorials/StartLocationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartLocation-response)))
  "Returns string type for a service object of type 'StartLocation-response"
  "beginner_tutorials/StartLocationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartLocation-response>)))
  "Returns md5sum for a message object of type '<StartLocation-response>"
  "d6307ff24f7891bc5f677dc387c942bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartLocation-response)))
  "Returns md5sum for a message object of type 'StartLocation-response"
  "d6307ff24f7891bc5f677dc387c942bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartLocation-response>)))
  "Returns full string definition for message of type '<StartLocation-response>"
  (cl:format cl:nil "int64 here~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartLocation-response)))
  "Returns full string definition for message of type 'StartLocation-response"
  (cl:format cl:nil "int64 here~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartLocation-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartLocation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StartLocation-response
    (cl:cons ':here (here msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StartLocation)))
  'StartLocation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StartLocation)))
  'StartLocation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartLocation)))
  "Returns string type for a service object of type '<StartLocation>"
  "beginner_tutorials/StartLocation")