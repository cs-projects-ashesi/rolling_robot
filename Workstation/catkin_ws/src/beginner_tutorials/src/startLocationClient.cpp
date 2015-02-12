#include "ros/ros.h"
#include "beginner_tutorials/StartLocation.h"
#include <cstdlib>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "startLocationClient");
	if(argc != 3)
	{
		ROS_INFO("Usage: startLocationClient [Start Location] [Current Location]");
		return 1;
	}
	
	ros::NodeHandle n;
	long int korsaOffice = 105;
	long int nathanOffice = 106;
	long int rebeccaOffice = 107;
	long int conference = 108;
	long int fiOffice = 109;
	long int odip = 110;
	long int jacksonOffice = 111;
	
	ros::ServiceClient client = n.serviceClient<beginner_tutorials::StartLocation>("StartLocation");
	beginner_tutorials::StartLocation srv;
	srv.request.where1 = atoll(argv[1]);
	srv.request.where2 = atoll(argv[2]);
	if(client.call(srv))
	{
		if((long int)srv.response.here==korsaOffice)
		{
			ROS_INFO("Start Location is: Dr. Ayorkor Korsah's office");
		}
		else if((long int)srv.response.here==nathanOffice)
		{
			ROS_INFO("Start Location is: Dr. Nathan Amanquah's office");
		}
		else if((long int)srv.response.here==rebeccaOffice)
		{
			ROS_INFO("Start Location is: Rebecca Awuah's office");
		}
		else if((long int)srv.response.here==conference)
		{
			ROS_INFO("Start Location is: Conference Room");
		}
		else if((long int)srv.response.here==fiOffice)
		{
			ROS_INFO("Start Location is: FI's Office");
		}
		else if((long int)srv.response.here==odip)
		{
			ROS_INFO("Start Location is: ODIP");
		}
		else if((long int)srv.response.here==jacksonOffice)
		{
			ROS_INFO("Start Location is: Dr. Charles Jackson's");
		}
		else
		{
			ROS_INFO("Start Location is: INVALID");
		}
	}
	else
	{
		ROS_ERROR("Failed to call service startLocation");
		return 1;
	}
	return 0;
}