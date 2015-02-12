#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_ros/filters/voxel_grid.h>
//PCL specific includes
#include <pcl/ros/conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>

ros::Publisher pub;

void cloud_cb (const sensor_msgs::PointCloud2ConstPtr& cloud)
{
	//...do data processing
	sensor_msgs::PointCloud2 cloud_filtered;
	
	//perform filtering of the data
	pcl::VoxelGrid<sensor_msgs::PointCloud2>sor;
	sor.setInputCloud(cloud);
	sor.setLeafSize(0.01, 0.01, 0.01);
	sor.filter(cloud_filtered);
	
	//Publish the data
	pub.publish(cloud_filtered);
}

int main(int argc, char** argv)
{
	//Initialize ROS
	ros::init (argc, argv, "my_pcl_tutorial");
	ros::NodeHandle nh;
	
	//Create a ROS subscriber for the input point cloud
	ros::Subscriber sub = nh.subscribe ("point_cloud", 1, cloud_cb);
	
	//Create a ROS publisher for the output point cloud
	pub = nh.advertise<sensor_msgs::PointCloud2>("point_cloud",1);
	
	//Spin
	ros::spin();
	return 0;
}