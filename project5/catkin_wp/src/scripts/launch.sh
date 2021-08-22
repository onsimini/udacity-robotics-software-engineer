#!/bin/sh
#!/bin/sh
xterm  -e  " gazebo " &
sleep 5
xterm  -e  " source /opt/ros/kinetic/setup.bash; roscore" & 
sleep 5
xterm  -e  " rosrun rviz rviz" 


# project_folder="/home/ros/work/udacity-robotics-software-engineer/project5/catkin_wp"
# xterm  -e  "cd ${project_folder} && source devel/setup.bash && roslaunch my_robot world.launch" &
# sleep 5
# xterm  -e  "cd ${project_folder} && source devel/setup.bash && roslaunch my_robot amcl.launch" &
# sleep 5
# xterm  -e  "cd ${project_folder} && source devel/setup.bash && rosrun rviz rviz" 
