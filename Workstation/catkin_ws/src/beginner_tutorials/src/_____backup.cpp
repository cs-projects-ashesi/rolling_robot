#include "ros/ros.h"
#include "beginner_tutorials/LocAndGo.h"
#include <cstdlib>

//Include statements for rapid-XML
#include</home/ash-rob-15/Desktop/rapidxml-1.13/rapidxml.hpp>

//include statements for localization 
#include "std_msgs/Header.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/PoseWithCovariance.h"
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
#include<vector>

//include statement for goal location
#include "geometry_msgs/PoseStamped.h"

//include statements for listening for overlap
#include "std_msgs/String.h"
#include <tf/transform_listener.h>

using namespace std;
using namespace rapidxml;

//These three structures represent the objects read from the XML.
struct InterestPoint
{
	string id;
	string name;
	string x;
	string y;
	string spiel;
};
struct Overlap
{
	string id;
	string exit_region;
	string next_map;
	string x;
	string y;
};
struct Map
{
	string yaml_file;
	vector<InterestPoint> interest_points;
	vector<Overlap> overlaps;
}; 
Map this_map = Map();
InterestPoint point;
Overlap overlap; 
//End

string response;

//Method that traverses the xml and returns a map struct with corresponding info
Map traverse_xml(const string& input_xml)
{
	vector<char> xml_copy(input_xml.begin(), input_xml.end());
	xml_copy.push_back('\0');

	xml_document<> doc;
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
		cout<<interest_point->first_attribute("x")->value()<<endl;
		cout<<interest_point->first_attribute("y")->value()<<endl;
		cout<<interest_point->first_attribute("spiel")->value()<<endl;

		//Add to interest point strucutre and add to map
		point = InterestPoint();
		point.id = interest_point->first_attribute("id")->value();
		point.name = interest_point->first_attribute("name")->value();
		point.x = interest_point->first_attribute("x")->value();
		point.y = interest_point->first_attribute("y")->value();
		point.spiel = interest_point->first_attribute("spiel")->value();
		this_map.interest_points.push_back(point);

		interest_point = interest_point->next_sibling("interest_point");
	}

	xml_node<>* an_overlap = map->first_node("overlap");
	while(an_overlap != NULL)
	{
		cout<<an_overlap->first_attribute("id")->value()<<endl;
		cout<<an_overlap->first_attribute("exit_region")->value()<<endl;
		cout<<an_overlap->first_attribute("next_map")->value()<<endl;
		cout<<an_overlap->first_attribute("x")->value()<<endl;
		cout<<an_overlap->first_attribute("y")->value()<<endl;

		//Add to interest point strucutre and add to map
		overlap = Overlap();
		overlap.id = an_overlap->first_attribute("id")->value();
		overlap.exit_region = an_overlap->first_attribute("exit_region")->value();
		overlap.next_map = an_overlap->first_attribute("next_map")->value();
		overlap.x = an_overlap->first_attribute("x")->value();
		overlap.y = an_overlap->first_attribute("y")->value();
		this_map.overlaps.push_back(overlap);

		an_overlap = an_overlap->next_sibling("overlap");
	}
	return this_map;
}
//End


//Method to localize
void localize(float posX, float posY, float posZ, float orientX, float orientY, 
		    float orientZ, float orientW)
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
		
		msg.pose.position.x= posX;
		msg.pose.position.y= posY;
		msg.pose.position.z= posZ;

		//Pose orientation
		msg.pose.orientation.x = orientX;
		msg.pose.orientation.y = orientY;
		msg.pose.orientation.z = orientZ;
		msg.pose.orientation.w = orientW;
		
		Initial.pose = msg;

		inital_pose.publish(Initial);
		ros::spinOnce();
		l_rate.sleep();
		loc_count++;
	}
}
//End

//Method to send goal
void sendGoal(float posX, float posY, float posZ, float orientX, float orientY, 
		       float orientZ, float orientW)
{
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
}
//End

//Method to check Overlap, parse next XML file and send server next yaml file

void check_overlap()
{
	ros::NodeHandle o;

	tf::TransformListener listener;
	ros::Rate rate(10);


	int overlapped=0;

	while (ros::ok() && overlapped==0)
	{
		tf::StampedTransform transform;
		cout<<"Listening for overlap"<< "\n";

		while(overlapped==0)
		{
			try
			{
				//ROS_INFO("Attempting to read pose...");
				listener.lookupTransform("/map","/base_link",ros::Time(0), transform);

				//if overlap crossed
				if(transform.getOrigin().y() < -8 )
				{

					cout<<"CROSSED !!!"<< "\n";
				}

			}
			catch (tf::TransformException ex)
			{
				ROS_ERROR("Nope! %s", ex.what());
			}
			rate.sleep();
		}
	}

}






int main(int argc, char **argv)
{
  ros::init(argc, argv, "loc_and_go_client");

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<beginner_tutorials::LocAndGo>("load_next_map");
  beginner_tutorials::LocAndGo srv;
  
  srv.request.overlap_info = "overlap_reached";

  int global_count=0;
  string response;

  while(global_count<2){
      //beginning of localization block
      ros::NodeHandle l;
      ros::Publisher inital_pose =  l.advertise<geometry_msgs::PoseWithCovarianceStamped>("initialpose/", 5);
      ros::Rate l_rate(1);

      int loc_count = 0;
      /*while(ros::ok() && loc_count<5){
          cout<<"publishing initial pose"<< "\n";
          geometry_msgs::PoseWithCovarianceStamped Initial;
          geometry_msgs::PoseWithCovariance msg;
          Initial.header.seq=0;
          Initial.header.frame_id="map";

          if(global_count==0){
              msg.pose.position.x= 1.78861348676;
              msg.pose.position.y= -6.67595915055;
              msg.pose.position.z= 0.0;

              //Pose orientation
              msg.pose.orientation.x = 0.0;
              msg.pose.orientation.y = 0.0;
              msg.pose.orientation.z = -0.64309053071;
              msg.pose.orientation.w = 0.765790160103;
          }

          else{

              msg.pose.position.x= 0.47146069447;
              msg.pose.position.y= -5.77483247776;
              msg.pose.position.z= 0.0;

              //Pose orientation
              msg.pose.orientation.x = 0.0;
              msg.pose.orientation.y = 0.0;
              msg.pose.orientation.z = -0.721998146777;
              msg.pose.orientation.w = 0.691894989178;
          }



          Initial.pose = msg;

          inital_pose.publish(Initial);
          ros::spinOnce();
          l_rate.sleep();
          loc_count++;
        }

      // end: localization block*/




      //start: goal setting block

      /*ros::NodeHandle g;
      ros::Publisher goal_pose =   g.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal", 5);

      ros::Rate g_rate(1);

      int goal_count = 0;
      while(ros::ok() && goal_count<3){
          geometry_msgs::PoseStamped GoalPose;

          GoalPose.header.frame_id = "/map";

          GoalPose.pose.position.x = 2.14605918205;
          GoalPose.pose.position.y = -8.67393391659;
          GoalPose.pose.position.z = 0.0;


          GoalPose.pose.orientation.x = 0.0;
          GoalPose.pose.orientation.y = 0.0;
          GoalPose.pose.orientation.z = -0.684796410097;
          GoalPose.pose.orientation.w = 0.728734434975;

          cout<<"Publishing goal"<< "\n";

          goal_pose.publish(GoalPose);

          ros::spinOnce();
          g_rate.sleep();
          goal_count++;
      }*/
      //end: goal setting block





      //start: overlap listener block

     /* ros::NodeHandle o;

      tf::TransformListener listener;
      ros::Rate rate(10);


      int overlapped=0;

      while (ros::ok() && overlapped==0){
          tf::StampedTransform transform;
          cout<<"Listening for overlap"<< "\n";

          while(overlapped==0){
              try
		{
                  //ROS_INFO("Attempting to read pose...");
                  listener.lookupTransform("/map","/base_link",ros::Time(0), transform);

                  //overlap crossed
                  if(transform.getOrigin().y() < -8 ){

                    cout<<"CROSSED !!!"<< "\n";

                    // If request is successful
                    if(client.call(srv)){
                        cout<<"requesting server"<< "\n";
                        cout<<srv.response.map_name<<"\n";
                        overlapped = 1;
                    }

                }
                else{
                     //do nothing
                    //cout<<"Not Yet!!!"<< "\n";
                }

		}

            catch (tf::TransformException ex){
                //ROS_ERROR("Nope! %s", ex.what());
            }

            //football_pub.publish(msg);
            //ros::spinOnce();

            rate.sleep();

          }



      }*/

      cout<<"starting over !!!"<< "\n";
      global_count++;

  }





  cout<<"Exiting"<< "\n";
  
  return 0;
}
