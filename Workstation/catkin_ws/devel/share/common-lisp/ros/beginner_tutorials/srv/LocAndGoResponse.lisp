; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude LocAndGoResponse-request.msg.html

(cl:defclass <LocAndGoResponse-request> (roslisp-msg-protocol:ros-message)
  ((yaml_file_to_load
    :reader yaml_file_to_load
    :initarg :yaml_file_to_load
    :type cl:string
    :initform ""))
)

(cl:defclass LocAndGoResponse-request (<LocAndGoResponse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocAndGoResponse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocAndGoResponse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<LocAndGoResponse-request> is deprecated: use beginner_tutorials-srv:LocAndGoResponse-request instead.")))

(cl:ensure-generic-function 'yaml_file_to_load-val :lambda-list '(m))
(cl:defmethod yaml_file_to_load-val ((m <LocAndGoResponse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:yaml_file_to_load-val is deprecated.  Use beginner_tutorials-srv:yaml_file_to_load instead.")
  (yaml_file_to_load m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocAndGoResponse-request>) ostream)
  "Serializes a message object of type '<LocAndGoResponse-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'yaml_file_to_load))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'yaml_file_to_load))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocAndGoResponse-request>) istream)
  "Deserializes a message object of type '<LocAndGoResponse-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaml_file_to_load) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'yaml_file_to_load) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocAndGoResponse-request>)))
  "Returns string type for a service object of type '<LocAndGoResponse-request>"
  "beginner_tutorials/LocAndGoResponseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocAndGoResponse-request)))
  "Returns string type for a service object of type 'LocAndGoResponse-request"
  "beginner_tutorials/LocAndGoResponseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocAndGoResponse-request>)))
  "Returns md5sum for a message object of type '<LocAndGoResponse-request>"
  "d31b37a33a93dda981fe451954a94874")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocAndGoResponse-request)))
  "Returns md5sum for a message object of type 'LocAndGoResponse-request"
  "d31b37a33a93dda981fe451954a94874")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocAndGoResponse-request>)))
  "Returns full string definition for message of type '<LocAndGoResponse-request>"
  (cl:format cl:nil "string yaml_file_to_load~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocAndGoResponse-request)))
  "Returns full string definition for message of type 'LocAndGoResponse-request"
  (cl:format cl:nil "string yaml_file_to_load~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocAndGoResponse-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'yaml_file_to_load))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocAndGoResponse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LocAndGoResponse-request
    (cl:cons ':yaml_file_to_load (yaml_file_to_load msg))
))
;//! \htmlinclude LocAndGoResponse-response.msg.html

(cl:defclass <LocAndGoResponse-response> (roslisp-msg-protocol:ros-message)
  ((load_status
    :reader load_status
    :initarg :load_status
    :type cl:string
    :initform ""))
)

(cl:defclass LocAndGoResponse-response (<LocAndGoResponse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocAndGoResponse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocAndGoResponse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<LocAndGoResponse-response> is deprecated: use beginner_tutorials-srv:LocAndGoResponse-response instead.")))

(cl:ensure-generic-function 'load_status-val :lambda-list '(m))
(cl:defmethod load_status-val ((m <LocAndGoResponse-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:load_status-val is deprecated.  Use beginner_tutorials-srv:load_status instead.")
  (load_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocAndGoResponse-response>) ostream)
  "Serializes a message object of type '<LocAndGoResponse-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'load_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'load_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocAndGoResponse-response>) istream)
  "Deserializes a message object of type '<LocAndGoResponse-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocAndGoResponse-response>)))
  "Returns string type for a service object of type '<LocAndGoResponse-response>"
  "beginner_tutorials/LocAndGoResponseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocAndGoResponse-response)))
  "Returns string type for a service object of type 'LocAndGoResponse-response"
  "beginner_tutorials/LocAndGoResponseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocAndGoResponse-response>)))
  "Returns md5sum for a message object of type '<LocAndGoResponse-response>"
  "d31b37a33a93dda981fe451954a94874")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocAndGoResponse-response)))
  "Returns md5sum for a message object of type 'LocAndGoResponse-response"
  "d31b37a33a93dda981fe451954a94874")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocAndGoResponse-response>)))
  "Returns full string definition for message of type '<LocAndGoResponse-response>"
  (cl:format cl:nil "string load_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocAndGoResponse-response)))
  "Returns full string definition for message of type 'LocAndGoResponse-response"
  (cl:format cl:nil "string load_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocAndGoResponse-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'load_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocAndGoResponse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LocAndGoResponse-response
    (cl:cons ':load_status (load_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LocAndGoResponse)))
  'LocAndGoResponse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LocAndGoResponse)))
  'LocAndGoResponse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocAndGoResponse)))
  "Returns string type for a service object of type '<LocAndGoResponse>"
  "beginner_tutorials/LocAndGoResponse")