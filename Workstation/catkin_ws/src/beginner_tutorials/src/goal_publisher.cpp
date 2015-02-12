#include "ros/ros.h"
#include "std_msgs/Header.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/PoseWithCovariance.h"
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>

using namespace std;

int main(int argc, char  **argv){

	ros::init(argc, argv, "goal_publisher");

	ros::NodeHandle n;

	ros::Publisher goal_pose =   n.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal", 5);


	ros::Rate loop_rate(1);
	
	int count = 0;
	while(ros::ok() && count<3){		
	geometry_msgs::PoseStamped GoalPose;

	GoalPose.header.frame_id = "/map";

        GoalPose.pose.position.x = 2.18372;//2.14605918205;
	GoalPose.pose.position.y = -7.11048;//-8.67393391659;
	GoalPose.pose.position.z = 0.0;

	GoalPose.pose.orientation.x = 0.0;
        GoalPose.pose.orientation.y = 0.0;
	GoalPose.pose.orientation.z =-0.691549;// -0.684796410097;
        GoalPose.pose.orientation.w = 0.72233;//0.728734434975;

	goal_pose.publish(GoalPose);

	ros::spinOnce();

	loop_rate.sleep();

        count++;
			
	}
	return 0;
}

