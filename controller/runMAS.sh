#! /bin/bash
FRAMEWORK="/usr/bin/jasonEmbedded"
clear
if [[ ! -f "$FRAMEWORK"  ]] 
then
    echo "Installing dependencies..."
    sudo clear
    echo "deb [trusted=yes] http://packages.chon.group/ chonos main" | sudo tee /etc/apt/sources.list.d/chonos.list
    sudo apt update
    sudo apt install jason-embedded -y
else
    echo "The computer has JasonEmbedded and SimulIDE"
fi

cd controllerReasoning
jasonEmbedded controller.mas2j
cd ..