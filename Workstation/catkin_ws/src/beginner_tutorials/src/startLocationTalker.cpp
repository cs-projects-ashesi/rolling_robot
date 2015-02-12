#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
#include <string>
using namespace std;

/**
* This tutorial demonstrates simple sending of messages over the ROS system
*/

int argc; char **argv;

void sendStartLocation()
{	
	//talker is node name
	ros::init(argc, argv, "talker");
	
	ros::NodeHandle n;
	
	//Get ready to Publish a message of type std_msgs::String, on the topic chatter
	ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter",1000);
	
	ros::Rate loop_rate(10);
	while(ros::ok())
	{
		std_msgs::String msg;
		std::stringstream ss;
		cout<<""<<endl;
		cout<<"Please select a start location(q to quit): "<<endl;
		cout<<"****************************************"<<endl;
		cout<<"1. Library"<<endl;
		cout<<"2. CS Wing"<<endl;
		cout<<"3. LAB 221"<<endl;
		cout<<"4. LAB 222"<<endl;
		cout<<"5. Lecture hall 217"<<endl;
		cout<<"****************************************"<<endl;
		cout<<""<<endl;
		string userInput;
		cin>>userInput;
		if(userInput=="q")
		{
			cout<<"Exiting..."<<endl;
			break;
		}
		
		ss << userInput;
		msg.data = ss.str();
		
		//Cout the following using ROS_INFO
		ROS_INFO("%s", msg.data.c_str());
		
		chatter_pub.publish(msg);
		cout<<"Starting location "<<userInput<<" sent to KOBUKI!!!"<<endl;
		ros::spinOnce();
		loop_rate.sleep();
		break;
	}
}





int main()
{
	sendStartLocation();	
	return 0;
}