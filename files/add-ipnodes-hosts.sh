#!/bin/sh

#name: add-ipnodes-hosts.sh

#Variables
HOSTFILE="/etc/hosts"
NODEIP=$(cat /tmp/nodeip)

sed -i 's/10.164.35.125/#/g' $HOSTFILE
sed -i 's/awsnode01/#/g' $HOSTFILE

#Write ip nodes
for LINE in ${NODEIP[@]}; do
echo "#########################" >> $HOSTFILE
CONTAINERSTATUS=$(echo "$LINE" >> $HOSTFILE)
echo "#################################" >> $HOSTFILE
done
#Just execute if need to change the hostname
#Change hostname
hostnamectl set-hostname $1

#Restart Network interface
/etc/init.d/network restart

cat /etc/hosts
