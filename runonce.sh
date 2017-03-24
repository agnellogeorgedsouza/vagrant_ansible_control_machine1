#!/bin/bash


if [ ! -f ~/runonce ]
then

echo " THIS IS FIRST TIME SETUP"
sudo apt-get update
echo "$1"  > /home/vagrant/.ssh/authorized_keys
echo "$1" > /root/.ssh/authorized_keys
sudo sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
sudo service ssh restart

echo " ###insalling ansible #####"

sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y 
sudo apt-get update
sudo apt-get install ansible -y 

touch ~/runonce

fi
