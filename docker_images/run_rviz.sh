docker run -it --rm \
               -e DISPLAY \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               --net foo \
               --name rviz \
               --env ROS_HOSTNAME=rviz \
               --env ROS_MASTER_URI=http://master:11311/ \
               kinect \
	       rosrun rviz rviz
