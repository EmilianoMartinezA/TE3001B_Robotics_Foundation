#!/usr/bin/env python
import rospy
import numpy as np
from std_msgs.msg import Float32
from pid_control.msg import motor_output
from pid_control.msg import motor_input
from pid_control.msg import set_point

#Setup parameters, vriables and callback functions here (if required)

class Controller:
   def __init__(self,dt):
      #Parametros PID
      self.dt = dt
      self.kp = rospy.get_param("/control_kp")
      self.kd = 0.0
      self.ki = rospy.get_param("/control_ki")
      #variables PID
      self.error    = 0
      self.prev_e   = 0
      self.sum_e    = 0
      self.diff_e   = 0
      self.u        = 0

      self.set_point_t  = 0
      self.set_point    = 0
      self.motor_output = 0
      self.motor_time   = 0
      self.motor_status = ""

      self.Output       = motor_input()

      self.control_out  = rospy.Publisher("/motor_input", motor_input, queue_size=1)
      self.error_out    = rospy.Publisher("/error", Float32, queue_size=1)

      rospy.Subscriber("/motor_output", motor_output, self.motor_output_callback)
      rospy.Subscriber("/set_point", set_point, self.set_point_callback)

   def motor_output_callback(self, msg):
      self.motor_output  = msg.output
      self.motor_time    = msg.time
      self.motor_status  = msg.status

   def set_point_callback(self,msg):
      self.set_point     = msg.setPoint
      self.set_point_t   = msg.setTime

   def control(self):
      self.error        = self.set_point - self.motor_output
      self.sum_e        += self.error * self.dt
      self.diff_e       = (self.error - self.prev_e) / self.dt
      self.u            = self.kp * self.error + self.ki * self.sum_e + self.kd * self.diff_e
      self.Output.input = self.u
      self.Output.time  = rospy.get_time()
      
      self.control_out.publish(self.Output)
      self.error_out.publish(self.error)

      self.prev_e       = self.error

   def stop(self):
      #Setup the stop message (can be the same as the control message)
      print("Stopping")


if __name__=='__main__':
    #Initialise and Setup node
    rospy.init_node("controller")

    controller = Controller(rospy.get_param("/control_dt", 1.0/1000.0))

    rate = rospy.Rate(100)

    print("The Controller is Running")
    rospy.on_shutdown(controller.stop)
    #Run the node
    while not rospy.is_shutdown():
        #Write your code here
        controller.control()

        rate.sleep()
