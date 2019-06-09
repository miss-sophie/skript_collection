#!/bin/bash
#
# Creates a role structure for ansible roles according to the best practices.
# Parameter: init_ansible.sh <ROLE_NAME>

ROLE_NAME=$1
ansible_directories=( defaults handlers meta tasks vars )
file_directories=( files templates )
# Var check
if [ -z "$ROLE_NAME" ]; then
	echo "No name provided. Using default."
	ROLE_NAME="default"
fi

mkdir $ROLE_NAME
cd $ROLE_NAME

for a_dir in "${ansible_directories[@]}"
do
mkdir $a_dir
echo "---" > ./$a_dir/main.yml
done

for a_dir in "${file_directories[@]}"
do
mkdir $a_dir
done

touch ./README.md