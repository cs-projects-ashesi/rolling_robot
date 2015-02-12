; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-srv)


;//! \htmlinclude Loc_and_goal-request.msg.html

(cl:defclass <Loc_and_goal-request> (roslisp-msg-protocol:ros-message)
  ((yaml_to_load
    :reader yaml_to_load
    :initarg :yaml_to_load
    :type cl:string
    :initform "")
   (spiel_to_play
    :reader spiel_to_play
    :initarg :spiel_to_play
    :type cl:string
    :initform ""))
)

(cl:defclass Loc_and_goal-request (<Loc_and_goal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Loc_and_goal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Loc_and_goal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<Loc_and_goal-request> is deprecated: use beginner_tutorials-srv:Loc_and_goal-request instead.")))

(cl:ensure-generic-function 'yaml_to_load-val :lambda-list '(m))
(cl:defmethod yaml_to_load-val ((m <Loc_and_goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:yaml_to_load-val is deprecated.  Use beginner_tutorials-srv:yaml_to_load instead.")
  (yaml_to_load m))

(cl:ensure-generic-function 'spiel_to_play-val :lambda-list '(m))
(cl:defmethod spiel_to_play-val ((m <Loc_and_goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:spiel_to_play-val is deprecated.  Use beginner_tutorials-srv:spiel_to_play instead.")
  (spiel_to_play m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Loc_and_goal-request>) ostream)
  "Serializes a message object of type '<Loc_and_goal-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'yaml_to_load))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'yaml_to_load))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'spiel_to_play))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'spiel_to_play))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Loc_and_goal-request>) istream)
  "Deserializes a message object of type '<Loc_and_goal-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaml_to_load) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'yaml_to_load) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'spiel_to_play) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'spiel_to_play) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Loc_and_goal-request>)))
  "Returns string type for a service object of type '<Loc_and_goal-request>"
  "beginner_tutorials/Loc_and_goalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Loc_and_goal-request)))
  "Returns string type for a service object of type 'Loc_and_goal-request"
  "beginner_tutorials/Loc_and_goalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Loc_and_goal-request>)))
  "Returns md5sum for a message object of type '<Loc_and_goal-request>"
  "b48339be862ff57febbdc1974512c0b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Loc_and_goal-request)))
  "Returns md5sum for a message object of type 'Loc_and_goal-request"
  "b48339be862ff57febbdc1974512c0b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Loc_and_goal-request>)))
  "Returns full string definition for message of type '<Loc_and_goal-request>"
  (cl:format cl:nil "string yaml_to_load~%string spiel_to_play~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Loc_and_goal-request)))
  "Returns full string definition for message of type 'Loc_and_goal-request"
  (cl:format cl:nil "string yaml_to_load~%string spiel_to_play~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Loc_and_goal-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'yaml_to_load))
     4 (cl:length (cl:slot-value msg 'spiel_to_play))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Loc_and_goal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Loc_and_goal-request
    (cl:cons ':yaml_to_load (yaml_to_load msg))
    (cl:cons ':spiel_to_play (spiel_to_play msg))
))
;//! \htmlinclude Loc_and_goal-response.msg.html

(cl:defclass <Loc_and_goal-response> (roslisp-msg-protocol:ros-message)
  ((map_name
    :reader map_name
    :initarg :map_name
    :type cl:string
    :initform "")
   (load_status
    :reader load_status
    :initarg :load_status
    :type cl:string
    :initform "")
   (play_status
    :reader play_status
    :initarg :play_status
    :type cl:string
    :initform ""))
)

(cl:defclass Loc_and_goal-response (<Loc_and_goal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Loc_and_goal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Loc_and_goal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-srv:<Loc_and_goal-response> is deprecated: use beginner_tutorials-srv:Loc_and_goal-response instead.")))

(cl:ensure-generic-function 'map_name-val :lambda-list '(m))
(cl:defmethod map_name-val ((m <Loc_and_goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:map_name-val is deprecated.  Use beginner_tutorials-srv:map_name instead.")
  (map_name m))

(cl:ensure-generic-function 'load_status-val :lambda-list '(m))
(cl:defmethod load_status-val ((m <Loc_and_goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:load_status-val is deprecated.  Use beginner_tutorials-srv:load_status instead.")
  (load_status m))

(cl:ensure-generic-function 'play_status-val :lambda-list '(m))
(cl:defmethod play_status-val ((m <Loc_and_goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-srv:play_status-val is deprecated.  Use beginner_tutorials-srv:play_status instead.")
  (play_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Loc_and_goal-response>) ostream)
  "Serializes a message object of type '<Loc_and_goal-response>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'play_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'play_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Loc_and_goal-response>) istream)
  "Deserializes a message object of type '<Loc_and_goal-response>"
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'play_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'play_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Loc_and_goal-response>)))
  "Returns string type for a service object of type '<Loc_and_goal-response>"
  "beginner_tutorials/Loc_and_goalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Loc_and_goal-response)))
  "Returns string type for a service object of type 'Loc_and_goal-response"
  "beginner_tutorials/Loc_and_goalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Loc_and_goal-response>)))
  "Returns md5sum for a message object of type '<Loc_and_goal-response>"
  "b48339be862ff57febbdc1974512c0b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Loc_and_goal-response)))
  "Returns md5sum for a message object of type 'Loc_and_goal-response"
  "b48339be862ff57febbdc1974512c0b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Loc_and_goal-response>)))
  "Returns full string definition for message of type '<Loc_and_goal-response>"
  (cl:format cl:nil "string map_name~%string load_status~%string play_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Loc_and_goal-response)))
  "Returns full string definition for message of type 'Loc_and_goal-response"
  (cl:format cl:nil "string map_name~%string load_status~%string play_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Loc_and_goal-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_name))
     4 (cl:length (cl:slot-value msg 'load_status))
     4 (cl:length (cl:slot-value msg 'play_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Loc_and_goal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Loc_and_goal-response
    (cl:cons ':map_name (map_name msg))
    (cl:cons ':load_status (load_status msg))
    (cl:cons ':play_status (play_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Loc_and_goal)))
  'Loc_and_goal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Loc_and_goal)))
  'Loc_and_goal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Loc_and_goal)))
  "Returns string type for a service object of type '<Loc_and_goal>"
  "beginner_tutorials/Loc_and_goal")