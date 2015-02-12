#include "ros/ros.h"
#include "std_msgs/String.h"
#include "diagnostic_msgs/DiagnosticArray.h"
#include <cstdlib>
#include <sstream>

using namespace std;

void chatterCallback(const diagnostic_msgs::DiagnosticArray::ConstPtr& msg)
{
	string str = msg->status[7].values[1].value;
	istringstream buffer(str);
	int batLevel;
	buffer>>batLevel;
	
	if(batLevel <= 30)
	{	
		cout<<"ROBOT NOT READY"<<endl;
	}
	else
	{
		cout<<"ROBOT READY"<<endl;
	}
	cout<<msg->status[7].values[1].value<<endl;
}

int main(int argc, char **argv)
{
	ROS_INFO("Started listening");
	ros::init(argc, argv, "diagnostic_agg");
	
	ros::NodeHandle n;
	
	ros::Subscriber sub = n.subscribe("diagnostics_agg", 1000000000000000000000, chatterCallback);
	
	ros::spin();
	return 0;
}
