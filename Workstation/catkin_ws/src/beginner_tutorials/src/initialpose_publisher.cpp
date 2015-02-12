#include "ros/ros.h"
#include "std_msgs/Header.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/PoseWithCovariance.h"
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>

using namespace std;

int main(int argc, char **argv){

	ros::init(argc, argv, "initialpose_publisher");

	ros::NodeHandle n;

	ros::Publisher inital_pose =  n.advertise<geometry_msgs::PoseWithCovarianceStamped>("initialpose/", 5);


	ros::Rate loop_rate(1);
	
	int count = 0;
	while(ros::ok() && count<3){		
			geometry_msgs::PoseWithCovarianceStamped Initial;
			geometry_msgs::PoseWithCovariance msg;
			Initial.header.seq=0;
			Initial.header.frame_id="map";

			msg.pose.position.x= 1.78861348676;
			msg.pose.position.y= -6.67595915055;
			msg.pose.position.z= 0.0;

			//Pose orientation
			msg.pose.orientation.x = 0.0;
			msg.pose.orientation.y = 0.0;
			msg.pose.orientation.z = -0.64309053071;
			msg.pose.orientation.w = 0.765790160103;
			
			Initial.pose = msg;

			inital_pose.publish(Initial);
			ros::spinOnce();
			loop_rate.sleep();
		count++;
			
	}
	return 0;
}

