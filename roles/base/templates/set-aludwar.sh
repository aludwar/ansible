#!/bin/bash

useradd -p '$6$/xFdPAJvqAbyB/I7$KPqseBHmBZJ4qRW09hYnO8uX.GEyqga/3DaelNzTT0ZahpdAX2k/4hphXcz24lgID7VgGM1FZ1vnr7obAU09w1' aludwar
echo "aludwar ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/aludwar
chmod 0440 /etc/sudoers.d/aludwar
wget http://10.0.0.4/aludwar.tar && tar -xvf aludwar.tar -C /home/aludwar
