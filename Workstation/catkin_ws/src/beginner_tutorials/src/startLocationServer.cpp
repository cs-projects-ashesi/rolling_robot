#include "ros/ros.h"
#include "beginner_tutorials/StartLocation.h"

bool location(beginner_tutorials::StartLocation::Request &req, 
         beginner_tutorials::StartLocation::Response &res)
{
	res.here = req.where1;
	if((long int)req.where1==(long int)105)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to Ayorkor's office...");
		//Move to ayorkor's office
	}
	else if((long int)req.where1==(long int)106)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to Nathan's office");
		//Move to Nathan's office
	}
	else if((long int)req.where1==(long int)107)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to Rebecca Awuah's office");
		//Move to Rebecca Awuah's office
	}
	else if((long int)req.where1==(long int)108)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to Conference ROom");
		//Move to Conference room
	}
	else if((long int)req.where1==(long int)109)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to FI's Office");
		//Move to FI's office
	}
	else if((long int)req.where1==(long int)110)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to ODIP");
		//Move to ODIP
	}
	else if((long int)req.where1==(long int)111)
	{
		ROS_INFO("request: at=%ld", (long int)req.where1);
		ROS_INFO("sending back response: [%ld]", (long int)res.here);
		ROS_INFO("Current Location is: [%ld]",(long int)req.where2);
		ROS_INFO("Moving to Charles Jackson's office");
		//Move to Jackson's office
	}
	else
	{
		ROS_INFO("INVALID START LOCATION");
	}
	
	
	return true;
}

int main(int argc, char **argv)
{
	//ROS_INFO("Entered main");
	ros::init(argc, argv, "startLocationServer");
	ros::NodeHandle n;
	
	ros::ServiceServer service = n.advertiseService("StartLocation", location);
	ROS_INFO("Ready to display start location");
	ros::spin();
	
	return 0;
}