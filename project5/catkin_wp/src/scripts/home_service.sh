#!/bin/sh

rviz_path="$(rospack find add_markers)/src/marker_conf.rviz"

xterm -e "source devel/setup.bash && roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5
xterm -e "source devel/setup.bash && roslaunch turtlebot_gazebo amcl_demo.launch" &
sleep 5
xterm -e "source devel/setup.bash && roslaunch turtlebot_rviz_launchers view_navigation.launch rviz_path:=$rviz_path" &
sleep 5
xterm -e "source devel/setup.bash && rosrun add_markers add_markers" &
sleep 5
xterm -e "source devel/setup.bash && rosrun pick_objects pick_objects"
