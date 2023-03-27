#!/usr/bin/env python2
import rospy
import numpy as np
from std_msgs.msg import Float32

#Global variable to store the data from the message in the /signal topic
signal_data = 0

# Example Callback Function (Hint)
def callTime(msg):
    rospy.loginfo( "Time: %s", msg.data)

def callback(msg):
    global signal_data
    signal_data = msg.data
    rospy.loginfo( "Sin Modified %s", signal_data)

def callSignal(msg):
    rospy.loginfo( " Sine: %s", msg.data)


if __name__=='__main__':
    #Finish configuring your node here (part of the code has already been written as a hint)
    rospy.init_node("process")
    signal_processed = rospy.Subscriber("signal", Float32, callSignal)
    pub = rospy.Publisher("signal_processed", Float32, queue_size = 10)
    #Subscriber example (Hint)
    rospy.Subscriber("/signal", Float32, callback)
    rate = rospy.Rate(10)


    while not rospy.is_shutdown():
        #Write your code here
        if signal_data < 0:
            signal_data = signal_data*-1
        signal_data += 10
        signal_data/=2
        pub.publish(signal_data)
        rate.sleep()
