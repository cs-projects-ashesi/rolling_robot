#include "ros/ros.h"
#include "beginner_tutorials/LocomotionService.h"
#include "std_msgs/Header.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/PoseWithCovariance.h"
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>

using namespace std;


struct location {
  string name;
  string office_owner;
  float pos_x;
  float pos_y;
  float orient_z;
  float orient_w;
};

location cs_loc;

bool move(beginner_tutorials::LocomotionService::Request  &req,
         beginner_tutorials::LocomotionService::Response &res)
{
  std::string a = "Going to ";
  res.response = a + req.location.c_str();
  ROS_INFO("request: x=%s", req.location.c_str());
  ROS_INFO("sending back response: [%s]", res.response.c_str());

  

 /*string z stores the location to be visited
  *z is initialized to req.location.c_string() as recievied from client
  * 
  */

  string z = req.location.c_str();

 /*
  * A better implementation of the code below will make use of a function that reads location
  * and orientation coordinates from text files, based on location requested.
  *
  * The use of literals below was a last resort due to time constraint and a difficulty
  * reading text files in a modular fashion
  */

  if(z=="105"){
	 cs_loc.pos_x = 3.63229978038; 
     cs_loc.pos_y = 0.248312940851;
     cs_loc.orient_z = 0.661226050102;
     cs_loc.orient_w = 0.750186717202;
  }


  if(z=="106"){
	 cs_loc.pos_x = 6.48545791995; 
     cs_loc.pos_y = 0.0878546293853;
     cs_loc.orient_z = 0.557004388578;
     cs_loc.orient_w = 0.830509549075;
  }


 if(z=="107"){
	 cs_loc.pos_x = 8.02770072947; 
     cs_loc.pos_y = 0.161077855852;
     cs_loc.orient_z = 0.591909621469 ;
     cs_loc.orient_w = 0.806004342428;
  }


 if(z=="108"){
	 cs_loc.pos_x = 7.57926050591; 
         cs_loc.pos_y = -1.65666177451; 
         cs_loc.orient_z = -0.156962329511; 
         cs_loc.orient_w = 0.987604590468; 
  }


 if(z=="109"){
	 cs_loc.pos_x = 7.04491030205; 
     cs_loc.pos_y = -2.87465580384;
     cs_loc.orient_z = -0.579262053316;
     cs_loc.orient_w = 0.815141382576;
  }


 if(z=="110"){
	 cs_loc.pos_x = 5.67703042619; 
     cs_loc.pos_y = -2.73490739355;
     cs_loc.orient_z = -0.75632496931;
     cs_loc.orient_w = 0.654196102708;
  }


 if(z=="111"){
	 cs_loc.pos_x = 5.08522413609; 
         cs_loc.pos_y = -1.36631684265; 
         cs_loc.orient_z = -0.999958117635; 
         cs_loc.orient_w = 0.00915221153793; 
  }


 ros::NodeHandle t;

 ros::Publisher drive_goal =  t.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal", 5);

 ros::Rate loop_rate(1);
	
 //count variable keeps track of number of times goal is sent over topic
 int count = 0;

 while(ros::ok() && count <3){

	
	geometry_msgs::PoseStamped GoalPose;

	GoalPose.header.frame_id = "/map";

    GoalPose.pose.position.x = cs_loc.pos_x;
	GoalPose.pose.position.y = cs_loc.pos_y;
	GoalPose.pose.position.z = 0.0;

    GoalPose.pose.orientation.x = 0.0;
    GoalPose.pose.orientation.y = 0.0;
	GoalPose.pose.orientation.z = cs_loc.orient_z;
    GoalPose.pose.orientation.w = cs_loc.orient_w;

	drive_goal.publish(GoalPose);

	ros::spinOnce();

	loop_rate.sleep();

    count++;
			
 }

 return true;
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "locomotion_server");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("locomotion", move);
  ROS_INFO("Locomotion Server Launched");
  ros::spin();

  return 0;
}


