# slam_lidar_kinect

Instalação:
- Clonar o repositório em ~/catkin_ws/src/
- Executar em ~/catkin_ws/ --> $ catkin_make

Pacotes necessários:
- hector_slam

Arquivos necessários:
- hector_slam

/opt/ros/kinetic/share/...

...hector_mapping --> mapping_default_single_lidar.launch e mapping_default_dual_lidar.launch

...hector_geotiff --> geotiff_default_lidar.launch

Utilização:
- Executar em ~/catkin_ws/ --> $ source devel/setup.bash

(habilita o terminal para executar os arquivos .launch)

Arquivos .launch:
- Todos os arquivos devem possuir no nome sua aplicação, vindo em primeiro o tipo de aplicação
- Devem estar apenas em launch/ pra serem executados
