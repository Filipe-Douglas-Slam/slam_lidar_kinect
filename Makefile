DOCKER-PARAMS := -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --privileged \
               -e QT_X11_NO_MITSHM=1 \
               -e SVGA_VGPU10=0 \
               --net foo

ROS_MATER_HTTP := --env ROS_MASTER_URI=http://master:11311/

DOCKER_TAG := ros:kinect

DOCKER_NAME = "master"

docker-build:
	docker network create foo || echo "Network already exists"
	docker build --file Dockerfile --tag $(DOCKER_TAG) .

docker-roscore-run:
	xhost +local:docker
	docker run -it --rm -d \
               $(DOCKER-PARAMS) \
               --name master \
               --env ROST_NAME=master \
               $(DOCKER_TAG) \
               roscore && \
    make docker-gazebo-run && \
    sleep 10 && \
    make map_spawn && \
    sleep 10 && \
    make docker-spawn-megazord

docker-rviz-run:
	xhost +local:docker
	docker run --rm \
               $(DOCKER-PARAMS) \
               --name rviz \
               --env ROS_HOSTNAME=rviz \
               $(ROS_MATER_HTTP)\
               $(DOCKER_TAG) \
               rosrun rviz rviz

docker-spawn-one-kinect:
	docker exec -it -d master /bin/bash -c "source /root/catkin_ws/devel/setup.bash && roslaunch one_kinect_robot spawn.launch"

docker-spawn-megazord:
	docker exec -it -d master /bin/bash -c "source /root/catkin_ws/devel/setup.bash && roslaunch two_laser_one_kinect_robot spawn.launch"


docker-ros-env:
	docker exec -it master /bin/bash

map_spawn:
	docker exec -it -d master /bin/bash -c "source /root/catkin_ws/devel/setup.bash && roslaunch world_env spawn.launch"

docker-gazebo-run:
	docker exec -it -d master /bin/bash -c "source /opt/ros/kinetic/setup.bash && roslaunch --wait gazebo_ros empty_world.launch pause:=false"

docker-keyboard-run:
	docker exec -it master /bin/bash -c "source /opt/ros/kinetic/setup.bash && rosrun teleop_twist_keyboard teleop_twist_keyboard.py"

rtab-map-launch:
	docker exec -it master /bin/bash -c "source /opt/ros/kinetic/setup.bash && roslaunch one_kinect_robot fodazi.launch"

rtab-map-launch-megazord:
	docker exec -it master /bin/bash -c "source /opt/ros/kinetic/setup.bash && roslaunch two_laser_one_kinect_robot nastinha.launch"

docker-pull-catkin_ws:
    docker cp files/ $(DOCKER_NAME):/root/ 

