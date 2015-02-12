#include "ros/ros.h"
#include "beginner_tutorials/LocomotionServer.h"
#include <cstdlib>

int main (int argc, char **argv)
{
	ros::init(argc, argv, "locomotion_client");
	{
		ROS_INFO("specify location to visit");
		return 1;
	}
		
	ros::Nodehandle n;
	ros:ServiceClient  client = n.serviceClient<beginner_tutorials::LocomotionClient>(locomotion_client);
	
	beginner_tutorials::LocomotionServer srv;
	srv.request.location = argv[1];
		
	if(client.call(srv))
	{
		ROS_INFO("reached location: %ld", (string)srv.response.response);
	}
	else
	{
		ROS_ERROR("Failed to call service locomotion_server");
		return 1;
	}
	
	return 0;
}