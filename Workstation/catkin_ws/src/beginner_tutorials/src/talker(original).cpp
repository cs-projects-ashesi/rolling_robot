#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>

/**
* This tutorial demonstrates simple sending of messages over the ROS system
*/

int main(int argc, char **argv)
{
	//talker is node name
	ros::init(argc, argv, "talker2");
	
	ros::NodeHandle n;
	
	//Get ready to Publish a message of type std_msgs::String, on the topic chatter
	ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter2",1000);
	
	ros::Rate loop_rate(10);
	
	int count = 0;
	while(ros::ok())
	{
		std_msgs::String msg;
		std::stringstream ss;
		ss << "Hello world "<<count;
		msg.data = ss.str();
		
		//Cout the following using ROS_INFO
		ROS_INFO("%s", msg.data.c_str());
		
		chatter_pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
		++count;
	}
	return 0;
}