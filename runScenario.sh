#! /bin/bash
cd controller/
xterm -T "Controller Multiagent System" -e ./runMAS.sh &
cd ../busPoint/
xterm -T "BusPoint Multiagent System" -e ./runMAS.sh &
cd ../bus/
xterm -T "Bus Multiagent System" -e ./runMAS.sh &
cd ..
