#!/bin/sh
project_folder="/home/ros/work/udacity-robotics-software-engineer/project4/catkin_wp"
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch my_robot world.launch" &
sleep 5
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch my_robot amcl.launch" &
sleep 5
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch my_robot teleop.launch" &
sleep 5
xterm -e "cd ${project_folder} && source devel/setup.bash && roslaunch my_robot mapping.launch"
