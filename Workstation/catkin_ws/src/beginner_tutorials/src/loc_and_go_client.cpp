#include "ros/ros.h"
#include "beginner_tutorials/Loc_and_goal.h"
#include <cstdlib>
#include <algorithm>
#include <sstream>
#include <typeinfo>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/transform_datatypes.h>
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

//Include statements for rapid-XML library located in the lib folder
#include<../rapidxml-1.13/rapidxml.hpp>
//end

//include statements for localization 
#include "std_msgs/Header.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/PoseWithCovariance.h"
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
#include <dirent.h>
#include<vector>
//end

//include statement for goal location
#include "geometry_msgs/PoseStamped.h"
//end


//include statements for listening for overlap
#include "std_msgs/String.h"
#include <tf/transform_listener.h>
//end


using namespace std;
using namespace rapidxml;

//These three structures represent the objects read from the XML.
struct InterestPoint
{
	string id;
	string name;
	double x;
	double y;
	double z;
	double w;
	string spiel;
};
struct Overlap
{
	string id;
	string exit_region;
	string next_map;
	double x;
	double y;
	double z;
	double w;
};
struct Map
{
	string yaml_file;
	vector<InterestPoint> interest_points;
	vector<Overlap> overlaps;
}; 


Map currMap = Map();
InterestPoint point;
Overlap overlap; 
//End


//Miscellaneous declarations
string response;
//Maps directory 
string maps_dir = "../Resources/Maps/";

//Exit spiel directory
string exit_spiel = "../Resources/Spiels/exit_spiel.mp3";





double zero_value = 0.000000000000000000000000000000000000000000000000000000001;
/*A NOTE ABOUT THE VARIABLE ABOVE*/
/*
*	Okay, at this point you might be wondering why there are so many zeros for that variable up there.
*	If you aren't, you should not be reading this code. Kindly call your someone to assist you get back to the windows partition :).
*	
*	Okay, for some reason ROS complains about an NaN input when an absolute zero such as 0.0 is passed to the localization method.
*	For this reason, I had to put that 1 at the end of all the zeros. Why this happens, I have no idea, but I'm trying very hard to fix it!
*	Please, figure it out if you can. If you cannot, please update the number below and add your full name in parenthesis :)
*
*	DEFEATED: 1 (Wumpini Hussein)
*	
*
*	UPDATE:
* 	I found out that C++ will produce an NaN if a float is divided by a zero, say x/0.0, where x can be any number. 
*	My guess is that while doing localization, ROS at some point divides a certain number by the coordinates. Since 
*	the zero_value variable is used as a coordinate and was 0.0, that division produced an NaN. Putting the 1 at the end
* 	therefore fixed the issue.
*/
//End





//Method that traverses the xml and returns a map struct with corresponding info
Map traverse_xml(const string& input_xml)
{
	Map this_map = Map();
	vector<char> xml_copy(input_xml.begin(), input_xml.end());
	xml_copy.push_back('\0');
	

	xml_document<> doc;
	cout<<"RIGHT HERE"<<endl;
	doc.parse<parse_declaration_node | parse_no_data_nodes>(&xml_copy[0]);

	xml_node<>* map = doc.first_node("map");
	xml_node<>* file_location = map->first_node("file_location");
	
	//Add to map struct and print
	this_map.yaml_file = file_location->first_attribute("location")->value();
	cout<<"File location: "<<file_location->first_attribute("location")->value()<<endl;

	xml_node<>* interest_point = map->first_node("interest_point");
	cout<<"Interest points"<<endl;
	while(interest_point != NULL)
	{
		cout<<interest_point->first_attribute("id")->value()<<endl;
		cout<<interest_point->first_attribute("name")->value()<<endl;
		cout<<atof(interest_point->first_attribute("x")->value())<<endl;
		cout<<atof(interest_point->first_attribute("y")->value())<<endl;
		cout<<atof(interest_point->first_attribute("z")->value())<<endl;
		cout<<atof(interest_point->first_attribute("w")->value())<<endl;
		cout<<interest_point->first_attribute("spiel")->value()<<endl;

		//Add to interest point strucutre and add to map
		point = InterestPoint();
		point.id = interest_point->first_attribute("id")->value();
		point.name = interest_point->first_attribute("name")->value();
		point.x = atof(interest_point->first_attribute("x")->value());
		point.y = atof(interest_point->first_attribute("y")->value());
		point.z = atof(interest_point->first_attribute("z")->value());
		point.w = atof(interest_point->first_attribute("w")->value());
		point.spiel = interest_point->first_attribute("spiel")->value();
		this_map.interest_points.push_back(point);//Add to interest points of this map

		interest_point = interest_point->next_sibling("interest_point");
	}

	xml_node<>* an_overlap = map->first_node("overlap");
	while(an_overlap != NULL)
	{
		cout<<an_overlap->first_attribute("id")->value()<<endl;
		cout<<an_overlap->first_attribute("exit_region")->value()<<endl;
		cout<<an_overlap->first_attribute("next_map")->value()<<endl;
		cout<<atof(an_overlap->first_attribute("x")->value())<<endl;
		cout<<atof(an_overlap->first_attribute("y")->value())<<endl;
		cout<<atof(an_overlap->first_attribute("z")->value())<<endl;
		cout<<atof(an_overlap->first_attribute("w")->value())<<endl;

		//Add to interest point strucutre and add to map
		overlap = Overlap();
		overlap.id = an_overlap->first_attribute("id")->value();
		overlap.exit_region = an_overlap->first_attribute("exit_region")->value();
		overlap.next_map = an_overlap->first_attribute("next_map")->value();
		overlap.x = atof(an_overlap->first_attribute("x")->value());
		overlap.y = atof(an_overlap->first_attribute("y")->value());
		overlap.z = atof(an_overlap->first_attribute("z")->value());
		overlap.w = atof(an_overlap->first_attribute("w")->value());
		this_map.overlaps.push_back(overlap);//Add to overlaps of this map

		an_overlap = an_overlap->next_sibling("overlap");
	}
	return this_map;
}
//End


//Method to localize
void localize(double posX, double posY, double posZ,  double orientX, double orientY, 
		    double orientZ, double orientW)
{
	ros::NodeHandle l;
	ros::Publisher inital_pose =  l.advertise<geometry_msgs::PoseWithCovarianceStamped>("initialpose/", 5);
	ros::Rate l_rate(1);
	
	int loc_count = 0;
	while(ros::ok() && loc_count<5)
	{
		cout<<"publishing initial pose"<< "\n";
		geometry_msgs::PoseWithCovarianceStamped Initial;
		geometry_msgs::PoseWithCovariance msg;
		Initial.header.seq = 0;
		Initial.header.frame_id="map";
		
		msg.pose.position.x = posX;//1.78861348676;//posX;
		msg.pose.position.y = posY;//-6.67595915055;//posY;
		msg.pose.position.z = posZ;//0.0000;//posZ;
		
		//Pose orientation
		msg.pose.orientation.x = orientX;//0.0000;//orientX;
		msg.pose.orientation.y = orientY;//0.0000;//orientY;
		msg.pose.orientation.z = orientZ;//-0.64309053071;//orientZ;
		msg.pose.orientation.w = orientW;//0.765790160103;//orientW;
		
		Initial.pose = msg;

		inital_pose.publish(Initial);
		ros::spinOnce();
		l_rate.sleep();
		loc_count++;
	}
}
//End


//Method to send goal, wait for goal reached, stop for sometime to play spiel and move on to next
/*
* This method requires the following include statements:
*	i. #include <move_base_msgs/MoveBaseAction.h>
	ii.#include <actionlib/client/simple_action_client.h>
	iii.#include <tf/transform_datatypes.h>

* For this method to work properly, a couple of things need to be done.
*	i. Clone the github repo https://github.com/ros-planning/navigation.git
		This is done because at the time of writing this code, move_base_msgs
		had not been catkinized.
	   After, copy the move_base_msgs folder into your catkin workspace.
	   Now you can catkin
	ii. Add the following dependencies to your CMakeLists.txt
		move_base_msgs and actionlib
	iii. Open your package.xml file of the package you're working on and add move_base_msgs and actionlib
	      as both <build_depend> and <run_depend>
*/
int sendGoal(double posX, double posY, double posZ,  double orientX, double orientY, 
		    double orientZ, double orientW, string spiel)
{
	// Read x, y and angle parameters
	double x, y, theta;
	ros::NodeHandle nh;
	nh.getParam("goal_x", x);
	nh.getParam("goal_y", y);
	nh.getParam("goal_theta", theta);

	// create the action client
	// true causes the client to spin its own thread
	MoveBaseClient ac("move_base", true);

	// Wait 60 seconds for the action server to become available
	ROS_INFO("Waiting for the move_base action server");
	ac.waitForServer(ros::Duration(60));

	ROS_INFO("Connected to move base server");

	// Send a goal to move_base
	move_base_msgs::MoveBaseGoal goal;
	goal.target_pose.header.frame_id = "map";
	goal.target_pose.header.stamp = ros::Time::now();

	goal.target_pose.pose.position.x = posX;
	goal.target_pose.pose.position.y = posY;
	goal.target_pose.pose.orientation.w = orientW;
	
	double radians = theta * (M_PI/180);
	tf::Quaternion quaternion;
	quaternion = tf::createQuaternionFromYaw(radians);

	geometry_msgs::Quaternion qMsg;
	tf::quaternionTFToMsg(quaternion, qMsg);

	goal.target_pose.pose.orientation = qMsg;

	ROS_INFO("Sending goal to: x = %f, y = %f, theta = %f", x, y, theta);
	ac.sendGoal(goal);

	// Wait for the action to return
	ac.waitForResult();

	if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
	{
		ROS_INFO("You have reached the goal!");
		//Tell Server to play corresponding spiel
		ros::NodeHandle n;
		ros::ServiceClient audio_client = n.serviceClient<beginner_tutorials::Loc_and_goal>("play_spiel");
		beginner_tutorials::Loc_and_goal srv;
		
		//Send the name of the sound file to be played by the server
		srv.request.spiel_to_play = spiel;
		if(audio_client.call(srv))
		{
			cout<<"Play Status: "<<srv.response.play_status<<endl;
		}
		else
		{
			cout<<"Failed to call spiel-playing service"<<endl;
		}

		
		//system("mplayer");
		//sleep(10);
	}
	else
	{
		ROS_INFO("The base failed for some reason");
	}
	return 0;
}
/*{
	ros::NodeHandle g;
	ros::Publisher goal_pose =   g.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal", 5);

	ros::Rate g_rate(1);
	
	int goal_count = 0;
	while(ros::ok() && goal_count<3)
	{
		geometry_msgs::PoseStamped GoalPose;

		GoalPose.header.frame_id = "/map";

		GoalPose.pose.position.x = posX;
		GoalPose.pose.position.y = posY;
		GoalPose.pose.position.z = posZ;


		GoalPose.pose.orientation.x = orientX;
		GoalPose.pose.orientation.y = orientY;
		GoalPose.pose.orientation.z = orientZ;
		GoalPose.pose.orientation.w = orientW;

		cout<<"Publishing goal"<< "\n";

		goal_pose.publish(GoalPose);

		ros::spinOnce();
		g_rate.sleep();
		goal_count++;
		
		
      }
}*/
//End

//Method to read XML Folder and populate a list with all XML files
vector<string> create_XML_list()
{
	vector<string> files = vector<string>();
	DIR *dpdf;
	struct dirent *epdf;
	
	dpdf = opendir(maps_dir);
	if(dpdf != NULL)
	{
		while(epdf = readdir(dpdf))
		{
			if(!strcmp(epdf->d_name,".")) continue;
			if(!strcmp(epdf->d_name,"..")) continue;
			//if(epdf->d_name[0] == ".") continue;
			
			if(strstr(epdf->d_name, ".xml"))
			{
				files.push_back(epdf->d_name);
				cout<<"adding "<<epdf->d_name<<endl;
			}
		}
	}
	sort(files.begin(), files.end());
	cout<<"SORTED MAPS"<<endl;
	for(int i=0; i<files.size();i++)
	{
		cout<<files[i]<<endl;
	}
	closedir(dpdf);
	return files;
}

bool check_goal(double threshold)
{
	ros::NodeHandle o;

	tf::TransformListener listener;
	ros::Rate rate(10);


	int overlapped=0;

	while (true)
	{
		tf::TransformListener listener;
		tf::StampedTransform transform;
		cout<<"Listening for overlap"<< "\n";
		
		try
		{
			ROS_INFO("Attempting to read pose...");
			listener.lookupTransform("/map","/base_link",ros::Time(0), transform);

			//if overlap crossed
			if(transform.getOrigin().y() < threshold )
			{
				cout<<"CROSSED !!!"<< "\n";
				return true;
				break;
			}
		}
		catch (tf::TransformException ex)
		{
			ROS_ERROR("Nope! %s", ex.what());
			return false;
			break;
		}
		rate.sleep();
	}
	
	/*while (ros::ok() && overlapped==0)
	{
		tf::StampedTransform transform;
		cout<<"Listening for overlap"<< "\n";

		while(overlapped==0)
		{
			try
			{
				ROS_INFO("Attempting to read pose...");
				listener.lookupTransform("/map","/base_link",ros::Time(0), transform);

				//if overlap crossed
				if(transform.getOrigin().y() < threshold )
				{

					cout<<"CROSSED !!!"<< "\n";
					return true;
				}

			}
			catch (tf::TransformException ex)
			{
				return false;
				ROS_ERROR("Nope! %s", ex.what());
				
			}
			rate.sleep();
		}
	}*/
}






int main(int argc, char **argv)
{
	
	//TO-DO 1: Read through file names in XML folder and populate a list*********************DONE!
		//		  Go through the list and parse each XML file***********************************DONE!
		//		  While parsing a particular XML file: 
		//			i. Send the name of the next yaml file to be loaded*********************DONE!
		//		  	ii. If response is good, localize and set each goal in the XML.*********************DONE!
		//			iii. If exit overlap is reached, load next XML*********************DONE!
	//END
	
	
	//ROS declarations
	ros::init(argc, argv, "loc_and_go_client");

	ros::NodeHandle n;
	ros::ServiceClient client = n.serviceClient<beginner_tutorials::Loc_and_goal>("load_next_map");
	ros::ServiceClient audio_client = n.serviceClient<beginner_tutorials::Loc_and_goal>("play_spiel");
	beginner_tutorials::Loc_and_goal srv;
	//End
	
	//Parsing declarations
	string actual_file;
	vector<string> xml_file = vector<string>();
	xml_file = create_XML_list();//create list from xml files in the folder
	//End
	
	
	string is_A_entrance_overlap;
	string is_B_entrance_overlap;
	Overlap entrance_overlap;
	Overlap exit_overlap;
	
	
	int i = 0;
	//While the last map has not been reached...
	do
	{
		//Parse current XML File 
		ostringstream file;
		file <<maps_dir<<xml_file[i];
		actual_file = file.str();
		cout<<actual_file.c_str()<<" about to be parsed..."<<endl;
		
		ifstream myfile(actual_file.c_str());
		vector<char> buffer((istreambuf_iterator<char>(myfile)), istreambuf_iterator<char>());
		buffer.push_back('\0');
		currMap = traverse_xml(&buffer[0]);	
		//End
		
		//Determine which of the overlaps is the entrance overlap and which is the exit overlap
		//If an overlap's exit region is false, it is the entrance region for the current map,
		//otherwise it's the exit region.
		is_A_entrance_overlap = currMap.overlaps[0].exit_region;
		is_B_entrance_overlap = currMap.overlaps[1].exit_region;
		
		if(strcmp(is_A_entrance_overlap.c_str(), "false"))
		{
			entrance_overlap = currMap.overlaps[0];
			exit_overlap = currMap.overlaps[1];
			
		}
		if(strcmp(is_B_entrance_overlap.c_str(), "false"))
		{
			entrance_overlap = currMap.overlaps[0];
			exit_overlap = currMap.overlaps[1];
		}
		
		cout<<"ENTRANCE OVERLAP: "<<endl;
		cout<<"x: "<<entrance_overlap.x<<" y:"<<entrance_overlap.y<<endl;
		cout<<"EXIT OVERLAP: "<<endl;
		cout<<"x: "<<exit_overlap.x<<" y:"<<exit_overlap.y<<endl;
		//End
		
		
		
		//Send the name of the yaml file to be loaded to the server and await response
		srv.request.yaml_to_load = currMap.yaml_file;
		cout<<"Sending the next YAML to load: "<<currMap.yaml_file.c_str()<<endl;
		
		//--------------------//If response is good, localize and set goal
		if(client.call(srv))
		{
			cout<<"Loaded map name: "<<srv.response.map_name<<endl;
			cout<<"Map load status: "<<srv.response.load_status<<endl;
			
			//----------------------------------//Localize block: Localize at entrance overlap
			cout<<"About to localize..........................."<<endl;
			//---------------------------------//Localize with entrance region coordinates
			
			//The line of code below produced an NaN because the zero_value variable used to be 0.0.
			localize(entrance_overlap.x, entrance_overlap.y, zero_value, zero_value, zero_value, entrance_overlap.z, entrance_overlap.w);
			//localize(0.000000, 0.0000, 0.0000, 0.00000, 0.00000, 0.0000, 0.00000);
			//localize(1.78861348676, -6.67595915055, 0.0000, 0.00000, 0.00000, -0.64309053071, 0.765790160103);
			
			cout<<"Localized"<<endl;
			//End
			
			//--------------------------------//Set Goal at all interest points and finally, set goal to exit region
			//--------------------------------loop through all the interest points of the current map and send them as goals
			for(int k=0;k<currMap.interest_points.size();k++)
			{
				cout<<"Sending goal for interest point: "<<k<<": "<<currMap.interest_points[k].name <<endl;
				sendGoal(currMap.interest_points[k].x, currMap.interest_points[k].y, zero_value, zero_value,zero_value,entrance_overlap.z, entrance_overlap.w, currMap.interest_points[k].spiel);
			}
			//End
			
			//After sending goals, send robot to exit overlap
			cout<<"Done here, Going to exit overlap..."<<endl;
			sendGoal(exit_overlap.x, exit_overlap.y, zero_value, zero_value, zero_value, exit_overlap.z, exit_overlap.w, exit_spiel);
			//sleep(20);
			
			i++;
			cout<<"Going to next map: "<<i<<endl;
			//End
			//break;
		}
		else
		{
			cout<<"Failed to call service"<<endl;
			cout<<"MAP NOT LOADED BY ROBOT FOR SOME REASON"<<endl;
			break;
		}
		
		
		//--------------------//End
		
		//End
	}
while(strcmp(entrance_overlap.next_map.c_str(), "END") != 0);
	return 0;
}
