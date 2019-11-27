#!/bin/bash####################################################################
###############################################################################
##                             AUTO INSTALL SVF                              ##
##                                                                           ##
## Hi, guys.                                                                 ##
##                                                                           ##
## Please make sure you manchine has 4cores and 5GB ram at least.            ##
##                                                                           ##
## Make sure your linux system is ubuntu 16.04 or 18.04 +                    ##
## Make sure user has root authority. it means root or sudo user.            ##
##                                                                           ##
## If you are not a root user, make sure your system has been installed sudo.##
##                                                                           ##
## Each time you should use 'source AutoInstallSVF' to run.                  ##
## Each time you should use 'source AutoInstallSVF' to run.                  ##
## Each time you should use 'source AutoInstallSVF' to run.                  ##
## The important things maust said three times :)                            ##
## Please do not use other way. That is Essential!                           ##
##                                                                           ##
## Do not warry about the PATH env                                           ##
## This script  can handle itself no mater how many times you use it         ##
##                                                                           ##
## However, the program will clean old results before new mission.           ##
## So, make sure you take the important data out of there.                   ##
##                                                                           ##
## After you have installed the SVF.                                         ##
## There are some tools you might be intertsted to take for youself.         ##
## All of them in subset folder.                                             ##
##                                                                           ##
## You can use check_network.sh to check network connection.                 ##
## Or you may like edit show_example-test.sh to build you own tools.         ##
##                                                                           ##
## OK, That is all. I Hope you like it.                                      ##
## Tianyang.Guan                                                             ##
## 22/Mar/2019 Fri 4:10AM                                                    ##
##                                                                           ##
###############################################################################
###############################################################################

#----------------------------------------------------------------#
echo -e "\033[42;37m Install essential system tools \033[0m"
bash ./subset/set_basic_systools.sh ret_string
if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Install essential system tools Well Done! \033[0m"
else
	echo -e "\033[41;33m Install essential system tools Somting Goes Wrong! \033[0m"
	return;
fi

source ./subset/check_network.sh
if [ "x$?" = x'0' ]; then
	echo -e "\033[43;37m Network connection well. \033[0m"
else 
	echo -e "\033[41;33m Network connection filed. \033[0m"
	return
fi

echo -e "\033[42;37m Set and cmake llvm clang \033[0m"
bash ./subset/set_cmake_llvm_9.0.0.sh ret_string

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Install essential system tools Well Done! \033[0m"
else
	echo -e "\033[41;33m Install essential system tools Somting Goes Wrong! \033[0m"
	return;
fi 

echo -e "\033[42;37m Source PATH environment \033[0m"
source ./subset/set_source_etc_profile_9.0.0.sh ret_string

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Source PATH eneironment Well Done! \033[0m"
else
	echo -e "\033[41;33m Source PATH environment Somting Goes Wrong! \033[0m"
	return;
fi 

echo -e "\033[42;37m Build SVF release space \033[0m"
bash ./subset/set_svf_release-build_online.sh ret_string

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Build SVF release space Well Done! \033[0m"
else
	echo -e "\033[41;33m Build SVF release space Somting Goes Wrong! \033[0m"
	return;
fi 


echo -e "\033[42;37m Build SVF debug space \033[0m"
bash ./subset/set_svf_debug-build.sh ret_string

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Build SVF debug space Well Done! \033[0m"
else
	echo -e "\033[41;33m Build SVF debug space Somting Goes Wrong! \033[0m"
	return;
fi 


echo -e "\033[42;37m Adjust SVF important parameters \033[0m"
bash ./subset/set_change_svf_setup_config_9.0.0.sh ret_string

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Adjust SVF important parameters Well Done! \033[0m"
else
	echo -e "\033[41;33m Adjust SVF important parameters Somting Goes Wrong! \033[0m"
	return;
fi 

echo -e "\033[42;37m Setup SVF WPA environment \033[0m"
bash ./subset/set_svf_environment-build.sh ret_string

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Setup SVF WPA environment Well Done! \033[0m"
else
	echo -e "\033[41;33m Setup SVF WPA environment Somting Goes Wrong! \033[0m"
	return;
fi 


echo -e "\033[42;37m Let's test a simple example\033[0m"
bash ./subset/show_example-test.sh

if [ "x$?" = x'0' ]; then
	echo -e "\033[44;37m Let's test a simple example Well Done! \033[0m"
else
	echo -e "\033[41;33m Let's test a simple example Somting Goes Wrong! \033[0m"
	return;
fi 

echo -e "\033[45;37m Good job! Well Done! \033[0m"
#----------------------------------------------------------------#
