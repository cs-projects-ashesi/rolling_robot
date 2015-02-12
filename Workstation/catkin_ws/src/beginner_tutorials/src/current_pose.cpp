#include "ros/ros.h"
#include "std_msgs/String.h"
#include <tf/transform_listener.h>
#include <iostream>
#include <fstream>

using namespace std;

int main(int argc, char **argv)
{

  ros::init(argc, argv, "current_position");
  ros::NodeHandle n;

  tf::TransformListener listener;

  int response = 2;


  while (true){

      cout << " "<<"\n";
      cout << "**********************************************";
      cout << " "<<"\n";
      cout << " To get current robot position enter 1."<< "\n";
      cout << " To exit enter 0."<< "\n";
      cout << " ";

      cin >> response;
      cout << " "<<"\n";

      if(response==0){
          cout << "Exiting..." << "\n";
          break;
      }

      else if(response==1){
          tf::StampedTransform transform;
          tf::Quaternion rotation;

          try{
              listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
              cout<<" Position:"<<"\n";
              cout<<"        X: "<<transform.getOrigin().x()<< "\n";
              cout<<"        Y: "<<transform.getOrigin().y()<< "\n";

              cout << " "<<"\n";
              cout<<" Orientation:"<<"\n";
              cout<<"        Z: "<<transform.getRotation().z()<< "\n";
              cout<<"        W: "<<transform.getRotation().w()<< "\n";

        }

        catch (tf::TransformException ex){
            //ROS_ERROR("Nope! %s", ex.what());
        }
      }

      else{
          cout<<" Enter valid input"<<"\n";
      }



  }

  return 0;
}
