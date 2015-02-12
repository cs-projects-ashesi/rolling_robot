#!/usr/bin/env python
import roslib; roslib.load_manifest('beginner_tutorials')

import sys
import socket
import rospy
from beginner_tutorials.srv import *


def locomotion_client(x):
	    rospy.wait_for_service('locomotion')
	    try:
		locomotion = rospy.ServiceProxy('locomotion', LocomotionService)
		print "at least found the service"
		resp1 = locomotion(x)		 # I think the actual call happens here	
		return resp1.response
	    except rospy.ServiceException, e:
		print "Service call failed: %s"%e



if __name__ == "__main__":
    #if len(sys.argv) == 2:
    x = sys.argv[1]
    #else:
    #    print usage()
    #    sys.exit(1)
    print "Requesting to go to %s"%(x)
    print "Result: %s"%(locomotion_client(x))
   
