#!/etc/bin/env bash
##################################### Start Safe Header ############################
#Developed by Alex Umansky aka TheBlueDrara
#Porpuse: Deploy A virtual environment to work with pip and python package dependencies
#Date 23.03.2025
set -o nounset
set -o errexit
set -o pipefail
##################################### End Safe Header ###############################


# HERE YOU WILL FIND ALL THE DIFFERENT TEMPLATES

####################################################################################
************************************************************************************
************************************************************************************
############ Checks if the OS is debian based ######################################

source /etc/os-release

if [[ $ID_LIKE == "debian" ]]; then
	echo "Running on Debian-family distro. Executing main code..."
else
	echo "This script is designed to run only on Debian-family distro only!"
	exit 1
fi

####################################################################################
************************************************************************************
************************************************************************************
############# A simple for loop to check and install dependencies ##################

source tool_list.txt # Create a text file with a var named TOOLS that contains a list of tools you want to download

function main(){
	for index in ${TOOLS[@]}; do
		check_and_install "$index"
	done
}

function check_and_install(){
	package=$1
	if ! dpkg -l | grep -q "^ii $package "; then
		sudo apt-get install "$package" -y
		return 1
	else
		return 0
	fi
}

main

#####################################################################################
*************************************************************************************
*************************************************************************************
#####################################################################################
