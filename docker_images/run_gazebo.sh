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


