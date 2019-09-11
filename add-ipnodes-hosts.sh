#!/bin/sh

#name: add-ipnodes-hosts.sh
# $1 hostname
# $2 IP

#Variables
HOSTFILE="/etc/hosts"

sed -i 's/10.164.35.125 awsnode01/#/g' $HOSTFILE

#Write ip nodes
echo "#########################" >> $HOSTFILE
echo "# Test AWS - Leonardo Almeida" >> $HOSTFILE
echo "# " >> $HOSTFILE
echo "$2                      $1" >> $HOSTFILE
echo "#################################" >> $HOSTFILE

#Just execute if need to change the hostname
#Change hostname
hostnamectl set-hostname $1

#Restart Network interface
/etc/init.d/network restart

cat /etc/hosts
