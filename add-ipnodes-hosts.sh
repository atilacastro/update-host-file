#!/bin/sh

#name: add-ipnodes-hosts.sh

#Variables
HOSTFILE="/etc/hosts"

sed -i 's/10.164.35.125 awsnode01/#/g' $HOSTFILE

#Write ip nodes
echo "#########################" >> $HOSTFILE
echo "# Hosts nodes HPC" >> $HOSTFILE
echo "# " >> $HOSTFILE
echo "10.164.20.33              awsnode15" >> $HOSTFILE
echo "10.164.20.21              awsnode16" >> $HOSTFILE
echo "10.164.20.147             awsnode17" >> $HOSTFILE
echo "10.164.21.26              awsnode18" >> $HOSTFILE
echo "10.164.20.172             awsnode19" >> $HOSTFILE
echo "10.164.20.116             awsnode20" >> $HOSTFILE
echo "10.164.20.210             awsnode21" >> $HOSTFILE
echo "10.164.21.63              awsnode22" >> $HOSTFILE
echo "#################################" >> $HOSTFILE

#Just execute if need to change the hostname
#Change hostname
hostnamectl set-hostname $1

#Restart Network interface
/etc/init.d/network restart

cat /etc/hosts
