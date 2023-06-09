#!/usr/bin/env python
import rospy
import numpy as np
import math as m

from std_msgs.msg import Float32


rospy.init_node("setpoint_generator")


setPointPub = rospy.Publisher("setpoint", Float32, queue_size=10)
init_time = rospy.get_time()


rate = rospy.Rate(10000)
nodeRate = rospy.get_param("/system_node_rate")


#Run the node
while not rospy.is_shutdown():

    #Write your code here
    time = rospy.get_time()-init_time
    referenceVal = abs(3*m.tan(pow(m.log(1/m.exp(m.sin(time*0.3))),3))+m.cos(time*0.3))
    setPointPub.publish(referenceVal) 

    rate.sleep()