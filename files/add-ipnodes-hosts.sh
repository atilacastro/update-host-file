#!/bin/sh

#name: add-ipnodes-hosts.sh

#Variables
HOSTFILE="/etc/hosts"
NODEIP=$(cat /tmp/node-ip.txt)

#sed -i 's/10.164.35.125/#/g' $HOSTFILE
#sed -i 's/awsnode01/#/g' $HOSTFILE

#Write ip nodes
IFS=$'\n'       # make newlines the only separator
for LINE in ${NODEIP[@]}; do
       sudo echo $LINE >> $HOSTFILE
done
#Just execute if need to change the hostname
#Change hostname
#hostnamectl set-hostname $1

#Restart Network interface
#/etc/init.d/network restart

#cat /etc/hosts
