#!/etc/bin/env bash
##################################### Start Safe Header ############################
#Developed by Alex Umansky aka TheBlueDrara
#Porpuse: Deploy A virtual environment to work with pip and python package dependencies
#Date 23.03.2025
set -o nounset
set -o errexit
set -o pipefail
##################################### End Safe Header ###############################



source /etc/os-realse


# Checks if the OS is debian based so the script can run



	if [[ $ID_LIKE == "*debian*" ]]; then
		echo "Running on Debian-family distro. Executing main code..."
	else
		echo "This script is designed to run only on Debian-family distory only!"
		exit 1
	fi
