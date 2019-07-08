#!/bin/bash
#
# Creates a role structure for ansible roles according to the best practices.
# Parameter: init_ansible.sh <ROLE_NAME>

TARGET_DIR=$1
ROLE_NAME=$2
ansible_directories=( defaults handlers meta tasks vars )
file_directories=( files templates )
# Var check
if [ -z "$ROLE_NAME" ]; then
	echo "No name provided. Using default."
	ROLE_NAME="default"
elif [ -z "$TARGET_DIR" ]; then
	echo "No target directory provided. Creating role here."
	TARGET_DIR="./"
elif [ ! -d "$TARGET_DIR" ]; then
	echo "Provided path is not a directory. Exiting."
	exit 1
fi
cd $TARGET_DIR

mkdir $ROLE_NAME
cd $ROLE_NAME || exit

for a_dir in "${ansible_directories[@]}"
do
mkdir "$a_dir"
echo "---" > "./$a_dir/main.yml"
done

for a_dir in "${file_directories[@]}"
do
mkdir "$a_dir"
done

touch ./README.md
echo "Done with all, have a great day :)"
exit 0