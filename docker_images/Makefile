docker-build:
	docker network create foo
	docker build --file Dockerfile --tag ros:kinect .

docker-roscore-run:
	docker run -it --rm \
               --net foo \
               --name master \
               --env ROST_NAME=master \
               ros:kinect \
               roscore

docker-rviz-run:
	xhost +local:docker
	docker run -it --rm \
               -e DISPLAY \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               --net foo \
               --name rviz \
               --env ROS_HOSTNAME=rviz \
               --env ROS_MASTER_URI=http://master:11311/ \
               ros:kinect \
	       rosrun rviz rviz

docker-ros-env:
	xhost +local:docker
	docker run -it --rm \
               -e DISPLAY \
               -e QT_X11_NO_MITSHM=1 \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               --net foo \
               --name env \
               --env ROS_HOSTNAME=env \
               --env ROS_MASTER_URI=http://master:11311/ \
               ros:kinect 

docker-gazebo-run:
	xhost +local:root & \
	docker run -it --rm \
               -e DISPLAY \
               -e QT_X11_NO_MITSHM=1 \
               -e SVGA_VGPU10=0 \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               --net foo \
               --name gazebo_dock \
               --env ROS_HOSTNAME=gazebo_dock \
               --env ROS_MASTER_URI=http://master:11311/ \
               ros:kinect \
               rosrun gazebo_ros gazebo
