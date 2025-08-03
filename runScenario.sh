#! /bin/bash
FRAMEWORK="/usr/bin/jasonEmbedded"
SIMULIDE="/opt/group.chon/simulide/simulide"
SERIALPORT="/dev/ttyEmulatedPort0"
XTERM="/usr/bin/xterm"

clear
if [[ ! -f "$FRAMEWORK"  ]] || [[ ! -f "$SIMULIDE" ]] || [[ ! -e "$SERIALPORT" ]] || [[ ! -e "$XTERM" ]]
then
    echo "Installing dependencies..."
    sudo clear
    echo "deb [trusted=yes] http://packages.chon.group/ chonos main" | sudo tee /etc/apt/sources.list.d/chonos.list
    sudo apt update
    sudo apt install linux-headers-`uname -r` -y
    sudo apt install jason-embedded chonos-serial-port-emulator chonos-simulide xterm -y
    clear
else
    echo "The computer has JasonEmbedded and SimulIDE"
fi

echo "Starting Simulation..."
sleep 3

cd controller/
xterm -T "Controller Multiagent System" -e ./runMAS.sh &
echo "Controller MAS Started..."
sleep 3

cd ../busPoint/
xterm -T "BusPoint Multiagent System" -e ./runMAS.sh &
echo "BusPoint MAS Started..."
sleep 3

cd ../bus/
xterm -T "Bus Multiagent System" -e ./runMAS.sh &
cd ..
echo "Bus MAS Started..."
