; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude LocAndGo-request.msg.html

(cl:defclass <LocAndGo-request> (roslisp-msg-protocol:ros-message)
  ((yaml_to_load
    :reader yaml_to_load
    :initarg :yaml_to_load
    :type cl:string
    :initform ""))
)

(cl:defclass LocAndGo-request (<LocAndGo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocAndGo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocAndGo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<LocAndGo-request> is deprecated: use beginner_tutorials-srv:LocAndGo-request instead.")))

(cl:ensure-generic-function 'yaml_to_load-val :lambda-list '(m))
(cl:defmethod yaml_to_load-val ((m <LocAndGo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:yaml_to_load-val is deprecated.  Use beginner_tutorials-srv:yaml_to_load instead.")
  (yaml_to_load m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocAndGo-request>) ostream)
  "Serializes a message object of type '<LocAndGo-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'yaml_to_load))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'yaml_to_load))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocAndGo-request>) istream)
  "Deserializes a message object of type '<LocAndGo-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaml_to_load) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'yaml_to_load) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocAndGo-request>)))
  "Returns string type for a service object of type '<LocAndGo-request>"
  "beginner_tutorials/LocAndGoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocAndGo-request)))
  "Returns string type for a service object of type 'LocAndGo-request"
  "beginner_tutorials/LocAndGoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocAndGo-request>)))
  "Returns md5sum for a message object of type '<LocAndGo-request>"
  "3650ee3cb67970bdb0ee42bf37cc3260")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocAndGo-request)))
  "Returns md5sum for a message object of type 'LocAndGo-request"
  "3650ee3cb67970bdb0ee42bf37cc3260")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocAndGo-request>)))
  "Returns full string definition for message of type '<LocAndGo-request>"
  (cl:format cl:nil "string yaml_to_load~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocAndGo-request)))
  "Returns full string definition for message of type 'LocAndGo-request"
  (cl:format cl:nil "string yaml_to_load~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocAndGo-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'yaml_to_load))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocAndGo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LocAndGo-request
    (cl:cons ':yaml_to_load (yaml_to_load msg))
))
;//! \htmlinclude LocAndGo-response.msg.html

(cl:defclass <LocAndGo-response> (roslisp-msg-protocol:ros-message)
  ((map_name
    :reader map_name
    :initarg :map_name
    :type cl:string
    :initform "")
   (load_status
    :reader load_status
    :initarg :load_status
    :type cl:string
    :initform ""))
)

(cl:defclass LocAndGo-response (<LocAndGo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocAndGo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocAndGo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<LocAndGo-response> is deprecated: use beginner_tutorials-srv:LocAndGo-response instead.")))

(cl:ensure-generic-function 'map_name-val :lambda-list '(m))
(cl:defmethod map_name-val ((m <LocAndGo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:map_name-val is deprecated.  Use beginner_tutorials-srv:map_name instead.")
  (map_name m))

(cl:ensure-generic-function 'load_status-val :lambda-list '(m))
(cl:defmethod load_status-val ((m <LocAndGo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:load_status-val is deprecated.  Use beginner_tutorials-srv:load_status instead.")
  (load_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocAndGo-response>) ostream)
  "Serializes a message object of type '<LocAndGo-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'load_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'load_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocAndGo-response>) istream)
  "Deserializes a message object of type '<LocAndGo-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'map_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'map_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'load_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'load_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocAndGo-response>)))
  "Returns string type for a service object of type '<LocAndGo-response>"
  "beginner_tutorials/LocAndGoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocAndGo-response)))
  "Returns string type for a service object of type 'LocAndGo-response"
  "beginner_tutorials/LocAndGoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocAndGo-response>)))
  "Returns md5sum for a message object of type '<LocAndGo-response>"
  "3650ee3cb67970bdb0ee42bf37cc3260")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocAndGo-response)))
  "Returns md5sum for a message object of type 'LocAndGo-response"
  "3650ee3cb67970bdb0ee42bf37cc3260")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocAndGo-response>)))
  "Returns full string definition for message of type '<LocAndGo-response>"
  (cl:format cl:nil "string map_name~%string load_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocAndGo-response)))
  "Returns full string definition for message of type 'LocAndGo-response"
  (cl:format cl:nil "string map_name~%string load_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocAndGo-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_name))
     4 (cl:length (cl:slot-value msg 'load_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocAndGo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LocAndGo-response
    (cl:cons ':map_name (map_name msg))
    (cl:cons ':load_status (load_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LocAndGo)))
  'LocAndGo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LocAndGo)))
  'LocAndGo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocAndGo)))
  "Returns string type for a service object of type '<LocAndGo>"
  "beginner_tutorials/LocAndGo")