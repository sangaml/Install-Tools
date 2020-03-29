#!/bin/bash
# Date: 29-03-2020
clear
#EUID = Effective user id
LOGFILE=script.log #Sending all logs into script.log file
ERRORFILE=script.err # All error logs will send in script.err file

export DEBIAN_FRONTEND=noninteractive 

# noninteractive = This is the anti-frontend. It never interacts with you  at  all, and  makes  the  default  answers  be used for all questions.

echo "Updating system..."
sudo apt update -y >>$LOGFILE 2>>$ERRORFILE

echo "Installing Docker..."
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y >>$LOGFILE 2>>$ERRORFILE \
echo | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - >>$LOGFILE 2>>$ERRORFILE \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" >>$LOGFILE 2>>$ERRORFILE \
sudo apt update -y >>$LOGFILE 2>>$ERRORFILE \
sudo apt install docker-ce -y >>$LOGFILE 2>>$ERRORFILE \
sudo usermod -aG docker ${USER} >>$LOGFILE 2>>$ERRORFILE 
echo "Installed Docker ...:)"