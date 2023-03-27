#!/usr/bin/env python2.7
import rospy
import numpy as np
from std_msgs.msg import Float32

if __name__=='__main__':

    #Finish configuring your node here (part of the code has already been written as a hint)
    pub = rospy.Publisher("time", Float32, queue_size = 10)
    pub1 = rospy.Publisher("signal", Float32, queue_size = 10)
    rospy.init_node("signal_generator")
    t = np.arange(0,10,0.1)
    a = np.sin(t)
    rate = rospy.Rate(10) #Rate in Hz
    time = 0
    signal_pub=rospy.Publisher("signal",Float32, queue_size=10)

    while not rospy.is_shutdown():
        #Write your code here  
        time += .1
        pub.publish(time)
        signal = np.sin(time)
        pub1.publish(signal) 
        
        rate.sleep()
        