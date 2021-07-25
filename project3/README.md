# udacity-robotics-software-engineer
### Robotics Software Engineer Nanodegree Program from Udacity

## Project 3 - Where Am I

### Project tasks

	[x] Set up simulation: environment and robot
	[x] Generate ground truth map from gazebo world
	[x] Build your AMCL lauch file
	[ ] Select proper localization parameters
	[ ] Add teleop node
	[ ] Put il all together

### Project setup

	needed packages:
```
	sudo apt-get install ros-kinetic-navigation
	sudo apt-get install ros-kinetic-map-server
	sudo apt-get install ros-kinetic-move-base
	sudo apt-get install ros-kinetic-amcl
	sudo apt-get install libignition-math2-dev protobuf-compiler
```

  	Needed repo:
```
  	cd catkin_ws/src/
	git clone https://github.com/udacity/pgm_map_creator.git
```

### Map generation

	Copy the world in the pgm_map_creator world folder
```
	cp my_world.world src/pgm_map_creator/world/my_world.world
```

	Add the plugin at the end or your world file, just before </world>.

```
	<plugin filename="libcollision_map_creator.so" name="collision_map_creator"/>
```

	Run the gzerver with your map
```
	gzserver src/pgm_map_creator/world/my_world.world
```

	Run the generator
```
	roslaunch pgm_map_creator request_publisher.launch
```

	The map will be generated in the pgm_map_creator/mas/your_map
	So check if it s ok and copy it in the src/map folder of your pacakge.
	Add the your_map.yaml file of the map with the image setting in the folder

```
  	<arg name="xmin" default="-15" />
 	<arg name="xmax" default="15" />
  	<arg name="ymin" default="-15" />
  	<arg name="ymax" default="15" />
  	<arg name="scan_height" default="5" />
  	<arg name="resolution" default="0.01" />
```	



REF: 
http://wiki.ros.org/map_server
http://wiki.ros.org/amcl
