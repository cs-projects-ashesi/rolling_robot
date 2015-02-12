#include "ros/ros.h"
#include "std_msgs/String.h"
using namespace std;

void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
	long int temp;
	temp = (long int)msg->data.c_str();
	
    if (temp == (long int) 105) {
        ROS_INFO("ROBOT is at Ayorkor's Office");
    }

    else if (temp == (long int) 106) {
        ROS_INFO("ROBOT is at Nathan's Office");
    }

    else if (temp == (long int)107) {
        ROS_INFO("ROBOT is at Rebecca's Office");
    }

    else if (temp == (long int)108) {
        ROS_INFO("ROBOT is at the Conference Room");
    }

    else if (temp == (long int)109) {
        ROS_INFO("ROBOT is at the FIs' Room");
    }

    else if (temp == (long int)110) {
        ROS_INFO("ROBOT is at the ODIP");
    }

    else if (temp == (long int)111) {
        ROS_INFO("ROBOT is at Charles' Office");
    }
    else
    {
	    ROS_INFO("%ld",msg->data.c_str());
    }
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "listener");
	
	ros::NodeHandle n;
	
	ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
	
	ros::spin();
	return 0;
}
