#include "ros/ros.h"
#include "beginner_tutorials/DirectCommand.h"
#include <cstdlib>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "receiveDirectCommandClient");
	if(argc != 2)
	{
		ROS_INFO("Usage: receiveDirectCommandClient [direct command] ");
		return 1;
	}
	ros::NodeHandle n;
	ros::ServiceClient client = n.serviceClient<beginner_tutorials::DirectCommand>("DirectCommand");
	beginner_tutorials::DirectCommand srv;
	srv.request.command = atoll(argv[1]);
	
	if(client.call(srv))
	{
		if((long int)srv.response.responseToCommand==(long int)999)
		{
			ROS_INFO("Going to charge");
		}
		else
		{
			ROS_INFO("INVALID INPUT");
		}
	}
	else
	{
		ROS_ERROR("Failed to call service startLocation");
		return 1;
	}
}