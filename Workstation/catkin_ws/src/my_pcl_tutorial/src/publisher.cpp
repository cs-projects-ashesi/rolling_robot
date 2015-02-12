#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
using namespace std;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

int main( int argc, char** argv)
{
	ros::init (argc, argv, "pub_pc1");
	ros::NodeHandle nh;
	//ros::Publisher pub = nh.advertise<PointCloud>("/camera/depth_registered/points",1);
	ros::Publisher pub = nh.advertise<PointCloud>("/my_point_cloud",1);
	
	PointCloud::Ptr msg (new PointCloud);
	msg->header.frame_id = "/base_footprint";
	msg->height = msg->width = 1;
	
	
	msg->points.push_back (pcl::PointXYZ(-0.487129, -0.187271, 0.915000));
	msg->points.push_back (pcl::PointXYZ(-0.485386, -0.167271, 0.915000));
	msg->points.push_back (pcl::PointXYZ(-0.283643, -0.147271, 0.915000));
	msg->points.push_back (pcl::PointXYZ(-0.181900, -0.127271, 0.915000));
	msg->points.push_back (pcl::PointXYZ(-0.480157, -0.107271, 0.915000));
	
	ros::Rate loop_rate(4);
	while(nh.ok())
	{
		msg->header.stamp = ros::Time::now();
		pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
	}
}