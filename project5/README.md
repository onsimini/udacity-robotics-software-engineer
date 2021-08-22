# udacity-robotics-software-engineer
### Robotics Software Engineer Nanodegree Program from Udacity

## Project 5 - Home Service Robot

### a brief write-up explaining the packages used
In this project, we used 
	- ![gmapping](http://wiki.ros.org/gmapping) to easily perform SLAM and build a map of the environment with a robot equipped with laser range finder sensors or RGB-D cameras.
	
	- ![turtlebot_teleop](http://wiki.ros.org/turtlebot_teleop) to manually control a robot using keyboard commands.
	
	- ![turtlebot_rviz_launchers](http://wiki.ros.org/turtlebot_rviz_launchers) to load a preconfigured rviz workspace and it will automatically load the robot model, 
	trajectories, and map for us.
	
	- ![turtlebot_gazebo](http://wiki.ros.org/turtlebot_gazebo) to deploy a turtlebot in a gazebo environment by linking the world file to it.
	
	- pick_object to give waypoint to the robot (the pick up coordonne first, and the drop out object 5 seconds after it reach the pick up point).
	
	- add_markers to show the pick up object at the pick up point until the robot reach this point, and make it disapear, and when the robot reach the drop off point the node make the object reapear in this point, simulation the delivrery project.


### Project tasks
	[x] Working environment
	[x] SLAM test environment and script
	[x] Localization test environment and script
	[x] Navigation node
	[x] Virtual object node
	[x] Put il all together - Home Service Robot


### Project setup
	needed packages:
```
	sudo apt-get install ros-kinetic-navigation
	sudo apt-get install ros-kinetic-map-server
	sudo apt-get install ros-kinetic-move-base
	sudo apt-get install ros-kinetic-amcl
```

  	Needed repo:
```
  	cd catkin_ws/src/
	git clone https://github.com/ros-perception/slam_gmapping.git  
	git clone https://github.com/turtlebot/turtlebot.git  
	git clone https://github.com/turtlebot/turtlebot_interactions.git  
	git clone https://github.com/turtlebot/turtlebot_simulator.git  
```

### Simulation setup check

	In project5/catkin_wp/src/scripts, run:
```
	./launch.sh
```

### Maping

	In project5/catkin_wp/src/scripts, run:
```
	./test_slam.sh
```

### Navigation

	In project5/catkin_wp/src/scripts, run:
```
	./test_nagigation.sh
```

### Waypoint Node

	In project5/catkin_wp/src/scripts, run:
```
	./pick_object.sh
```

### Virtual Object

	In project5/catkin_wp/src/scripts, run:
```
	./add_marker.sh
```

### Put it all together - HOME SERVICE ROBOT

	In project5/catkin_wp/src/scripts, run:
```
	./home_service.sh
```


