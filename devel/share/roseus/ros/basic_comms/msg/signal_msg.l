;; Auto-generated. Do not edit!


(when (boundp 'basic_comms::signal_msg)
  (if (not (find-package "BASIC_COMMS"))
    (make-package "BASIC_COMMS"))
  (shadow 'signal_msg (find-package "BASIC_COMMS")))
(unless (find-package "BASIC_COMMS::SIGNAL_MSG")
  (make-package "BASIC_COMMS::SIGNAL_MSG"))

(in-package "ROS")
;;//! \htmlinclude signal_msg.msg.html


(defclass basic_comms::signal_msg
  :super ros::object
  :slots (_time_x _signal_y ))

(defmethod basic_comms::signal_msg
  (:init
   (&key
    ((:time_x __time_x) 0.0)
    ((:signal_y __signal_y) 0.0)
    )
   (send-super :init)
   (setq _time_x (float __time_x))
   (setq _signal_y (float __signal_y))
   self)
  (:time_x
   (&optional __time_x)
   (if __time_x (setq _time_x __time_x)) _time_x)
  (:signal_y
   (&optional __signal_y)
   (if __signal_y (setq _signal_y __signal_y)) _signal_y)
  (:serialization-length
   ()
   (+
    ;; float64 _time_x
    8
    ;; float32 _signal_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _time_x
       (sys::poke _time_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _signal_y
       (sys::poke _signal_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _time_x
     (setq _time_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _signal_y
     (setq _signal_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get basic_comms::signal_msg :md5sum-) "00f39935c5dcc9cf05628912678eba28")
(setf (get basic_comms::signal_msg :datatype-) "basic_comms/signal_msg")
(setf (get basic_comms::signal_msg :definition-)
      "float64 time_x
float32 signal_y


")



(provide :basic_comms/signal_msg "00f39935c5dcc9cf05628912678eba28")


