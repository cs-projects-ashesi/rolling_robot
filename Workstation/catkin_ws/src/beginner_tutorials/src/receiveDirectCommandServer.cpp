#include "ros/ros.h"
#include "beginner_tutorials/DirectCommand.h"

bool direct_command(beginner_tutorials::DirectCommand::Request &req, 
         beginner_tutorials::DirectCommand::Response &res)
{
	res.responseToCommand = req.command;
	if((long int)req.command==(long int) 999)
	{
		ROS_INFO("request: [%ld]", (long int)req.command);
		ROS_INFO("sending back response: [%ld]", (long int)res.responseToCommand);
		ROS_INFO("Executing command");
		//Send robot to charge(to charge location)
	}
	else
	{
		ROS_INFO("COMMAND NOT BEING EXECUTED");
	}
	return true;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "receiveDirectCommandServer");
	ros::NodeHandle n;
	
	ros::ServiceServer service = n.advertiseService("DirectCommand", direct_command);
	ROS_INFO("Waiting for Direct command");
	ros::spin();
	
	return 0;
}