#!/bin/sh
project_folder="/home/ros/work/udacity-robotics-software-engineer/project5/catkin_wp"
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch turtlebot_gazebo amcl_demo.launch" &
sleep 5
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch turtlebot_rviz_launchers view_navigation.launch rviz_path:=${project_folder}/src/add_markers/src/marker_conf.rviz" &
sleep 5
xterm -e "cd ${project_folder} && source devel/setup.bash && rosrun add_markers add_markers"
