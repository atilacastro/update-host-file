#!/bin/sh

#name: copy-pub-key.sh

#Variables
KEYFILE=".ssh/authorized_keys"
NODEIP=$(cat /etc/ansible/script/node-ip2 | awk '{print $1}')

for LINE in ${NODEIP[@]}; do
       ssh-keyscan -H $NODEIP >> ~/.ssh/known_hosts
       cat /root/.ssh/id_rsa.pub | ssh -i /etc/ansible/keys/keypair-la00396-hpc.pem ec2-user@$LINE "cat >> $KEYFILE"
done
