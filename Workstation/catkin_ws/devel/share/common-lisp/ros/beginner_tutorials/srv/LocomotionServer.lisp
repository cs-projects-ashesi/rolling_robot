; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude LocomotionServer-request.msg.html

(cl:defclass <LocomotionServer-request> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type cl:string
    :initform ""))
)

(cl:defclass LocomotionServer-request (<LocomotionServer-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocomotionServer-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocomotionServer-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<LocomotionServer-request> is deprecated: use beginner_tutorials-srv:LocomotionServer-request instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <LocomotionServer-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:location-val is deprecated.  Use beginner_tutorials-srv:location instead.")
  (location m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocomotionServer-request>) ostream)
  "Serializes a message object of type '<LocomotionServer-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'location))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'location))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocomotionServer-request>) istream)
  "Deserializes a message object of type '<LocomotionServer-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'location) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'location) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocomotionServer-request>)))
  "Returns string type for a service object of type '<LocomotionServer-request>"
  "beginner_tutorials/LocomotionServerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocomotionServer-request)))
  "Returns string type for a service object of type 'LocomotionServer-request"
  "beginner_tutorials/LocomotionServerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocomotionServer-request>)))
  "Returns md5sum for a message object of type '<LocomotionServer-request>"
  "722edcd6f7b18d792b624fd4f614dd41")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocomotionServer-request)))
  "Returns md5sum for a message object of type 'LocomotionServer-request"
  "722edcd6f7b18d792b624fd4f614dd41")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocomotionServer-request>)))
  "Returns full string definition for message of type '<LocomotionServer-request>"
  (cl:format cl:nil "string location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocomotionServer-request)))
  "Returns full string definition for message of type 'LocomotionServer-request"
  (cl:format cl:nil "string location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocomotionServer-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'location))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocomotionServer-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LocomotionServer-request
    (cl:cons ':location (location msg))
))
;//! \htmlinclude LocomotionServer-response.msg.html

(cl:defclass <LocomotionServer-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass LocomotionServer-response (<LocomotionServer-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocomotionServer-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocomotionServer-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<LocomotionServer-response> is deprecated: use beginner_tutorials-srv:LocomotionServer-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <LocomotionServer-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:response-val is deprecated.  Use beginner_tutorials-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocomotionServer-response>) ostream)
  "Serializes a message object of type '<LocomotionServer-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocomotionServer-response>) istream)
  "Deserializes a message object of type '<LocomotionServer-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocomotionServer-response>)))
  "Returns string type for a service object of type '<LocomotionServer-response>"
  "beginner_tutorials/LocomotionServerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocomotionServer-response)))
  "Returns string type for a service object of type 'LocomotionServer-response"
  "beginner_tutorials/LocomotionServerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocomotionServer-response>)))
  "Returns md5sum for a message object of type '<LocomotionServer-response>"
  "722edcd6f7b18d792b624fd4f614dd41")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocomotionServer-response)))
  "Returns md5sum for a message object of type 'LocomotionServer-response"
  "722edcd6f7b18d792b624fd4f614dd41")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocomotionServer-response>)))
  "Returns full string definition for message of type '<LocomotionServer-response>"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocomotionServer-response)))
  "Returns full string definition for message of type 'LocomotionServer-response"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocomotionServer-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocomotionServer-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LocomotionServer-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LocomotionServer)))
  'LocomotionServer-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LocomotionServer)))
  'LocomotionServer-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocomotionServer)))
  "Returns string type for a service object of type '<LocomotionServer>"
  "beginner_tutorials/LocomotionServer")