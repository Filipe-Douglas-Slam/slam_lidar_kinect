docker run -it --rm \
               --net foo \
               --name master \
               --env ROST_NAME=master \
               ros:kinect \
               roscore
