DOCKER-PARAMS := -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --privileged \
               -e QT_X11_NO_MITSHM=1 \
               -e SVGA_VGPU10=0 \
               --net foo

ROS_MATER_HTTP := --env ROS_MASTER_URI=http://master:11311/

DOCKER_TAG := ros:kinect

docker-build:
	docker network create foo || echo "Network already exists"
	docker build --file Dockerfile --tag $(DOCKER_TAG) .

docker-roscore-run:
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name master \
               --env ROST_NAME=master \
               $(DOCKER_TAG) \
               roscore

docker-rviz-run:
	xhost +local:docker
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name rviz \
               --env ROS_HOSTNAME=rviz \
               $(ROS_MATER_HTTP)\
               $(DOCKER_TAG) \
	       rosrun rviz rviz

docker-ros-env:
	xhost +local:docker
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name env_`uuidgen` \
               --env ROS_HOSTNAME=env_`uuidgen` \
               $(ROS_MATER_HTTP) \
               $(DOCKER_TAG) 

docker-gazebo-run:
	xhost +local:root & \
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name gazebo_dock \
               --env ROS_HOSTNAME=gazebo_dock \
               $(ROS_MATER_HTTP) \
               $(DOCKER_TAG) \
               rosrun gazebo_ros gazebo
