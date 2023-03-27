#!/usr/bin/env python
import rospy
from std_msgs.msg import Float32
from pid_control.msg import motor_output
from pid_control.msg import motor_input


#Setup parameters, vriables and callback functions here (if required)
reference = 0
motor_out = 0
motor_init = False

def feedback(output):
    global motor_out
    global motor_init
    motor_out = output
    motor_init = True

def setpoint(msg):
    global reference
    reference = msg.data



if __name__=='__main__':
    #Initialise and Setup node
    rospy.init_node("controller")

    #Setup Publishers and subscribers here
    systemfeedback = rospy.Subscriber("motor_output", motor_output, feedback)
    setPointSub = rospy.Subscriber("setpoint", Float32, setpoint)

    controllerOut = rospy.Publisher("motor_input", motor_input, queue_size=10)  

    #Rate
    rateParam = rospy.get_param("/system_node_rate") 
    rate = rospy.Rate(rateParam)

    #Control Parameters
    kp = rospy.get_param("/Kp")
    Ti = rospy.get_param("/Ti")
    Td = rospy.get_param("/Td")
    reference = rospy.get_param("/set_point")

    #Error
    init_time = rospy.Time.now().to_sec()
    lastError = 0.0
    totError = 0.0

    motor_in = 0.0

    controllerOut.publish(motor_in, 0)
    rospy.loginfo("motor_in value: %f", motor_in)
    rospy.loginfo("Ref value: %f", reference)


    print("The Controller is Running")


    #Run the node
    while not rospy.is_shutdown():
        #Write your code here
        time = rospy.Time.now().to_sec() - init_time

        if time > 0 and motor_init:
            init_time = rospy.Time.now().to_sec()
            error = reference - motor_out.output
            totError += error*time
            rateError = (error - lastError) / time
            lastError = error

            #Control
            motor_in = (kp*error)+(Td*rateError)+(Ti*totError)
            rospy.loginfo("motor_in value: %f", motor_in)
            rospy.loginfo("Ref value: %f", reference)
            rospy.loginfo("motor_out.output: %f", motor_out.output)
            controllerOut.publish(motor_in, time)

        else:
            motor_in = 0
            controllerOut.publish(motor_in, time)
            

        rate.sleep()