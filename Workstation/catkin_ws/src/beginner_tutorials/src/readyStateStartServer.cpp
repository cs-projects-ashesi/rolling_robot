#include "ros/ros.h"
#include "beginner_tutorials/ReadyState.h"

bool ready_state(beginner_tutorials::ReadyState::Request &req, 
         beginner_tutorials::ReadyState::Response &res)
{
	res.ready = req.readyState;
	if((long int)req.readyState==(long int)11)
	{
		ROS_INFO("request: [%ld]", (long int)req.readyState);
		ROS_INFO("sending back response: [%ld]", (long int)res.ready);
		ROS_INFO("Putting robot in ready state");
		//Set variables responsible for making robot ready to move
	}
	else
	{
		ROS_INFO("ROBOT NOT READY!");
	}
	return true;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "readyStateStartServer");
	ros::NodeHandle n;
	
	ros::ServiceServer service = n.advertiseService("ReadyState", ready_state);
	ROS_INFO("Waiting to put robot in ready state");
	ros::spin();
	
	return 0;
}