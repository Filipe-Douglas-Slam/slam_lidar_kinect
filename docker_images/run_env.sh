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
