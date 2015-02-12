#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_ros/filters/voxel_grid.h>
#include <pcl/ros/conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <boost/foreach.hpp>

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

void callback(const PointCloud::ConstPtr& msg)
{
	//printf("MESSAGE RECEIVED!");
	printf("Cloud: width = %d, height = %d\n", msg->width, msg->height);
	BOOST_FOREACH(const pcl::PointXYZ& pt, msg->points)
	{
		printf("\t(%f, %f, %f)\n", pt.x, pt.y, pt.z);
	}
}

int main(int argc, char** argv)
{
	//printf("ABOUT TO SUBSCRIBE");
	ros::init(argc, argv, "sub_pc1");
	ros::NodeHandle nh;
	ros::Subscriber sub = nh.subscribe<PointCloud>("/camera/depth_registered/points", 1, callback);
	ros::spin();
}