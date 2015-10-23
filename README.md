# Tour Guide Robot
Robot tour guide research project.

TGR is a ROS node for stitching together multiple SLAM maps on the Turtlebot. This allows you break a large area into smaller, more manageable sections to be mapped individually. Once mapped, these local maps can be stitched together to represent the global map. TGR removes the need for large areas to be mapped in one go, and also the inaccuracy that comes with mapping such large areas. TGR also enables you to indicate points of interest on the map so they can be visited by the TurtleBot on command. In essesnce, TGR allows you to map a large area like a school, indicate points of interest, and later give tours of the environment, stopping at indicated points of interest and playing a spiel describing the location.

See the [wiki](https://github.com/cs-projects-ashesi/tour_guide_robot/wiki) for installation and set up instructions.
