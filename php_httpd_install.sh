#!/bin/bash

##############################################
#Purpos : To install and configure the "httpd" and "php" using script
#Version: 2.0
#Owner	: Aditya P <adityapatel@mycompany.com>
#Input	: None
#Output	: None
#Dependency: This file is dependent on master_fun_file
###############################################

# declearing the variable for function file
FUNCTION_FILE=master_fun_file

#calling the function file
. $FUNCTION_FILE

#===================== main proggram ===========================#

# check if master_fun_file is present in current directory
[ ! -f $(pwd)/$FUNCTION_FILE  ] &&  { echo "$FUNCTION_FILE not found, please place $FUNCTION_FILE in dir $(pwd)/"; exit 1; }

#calling the function to check root
root_or_not

echo -e "+-------------------------------------------------+"
echo -e "|             checking firewall                   |"
echo -e "+-------------------------------------------------+"

#stoping the firewall
SERVICE_NAME=firewalld
stop_service

#desibling the firewall
#disable_firewall # calling the function
SERVICE_NAME=firewalld
disable_service

echo -e "+-------------------------------------------------+"
echo -e "|          checking SELinux permission            |"
echo -e "+-------------------------------------------------+"

# changing the server security
change_to_permissive

echo -e "+-------------------------------------------------+"
echo -e "|              Installing httpd                   |"
echo -e "+-------------------------------------------------+"

#check if "httpd" package is installed or not
PACKAGE_NAME=httpd
check_install_package

#check if "net-tools" package is installed or not
PACKAGE_NAME=net-tools
check_install_package

#checking if service is running properly or not
SERVICE_NAME=httpd
start_service

# enabling the httdp service
SERVICE_NAME=httpd
enable_service

#finding the port for "httpd"
SHOW_PORT=httpd
find_port_no

echo -e "\n\t* * * Installation/Configuration completed for "httpd" service * * *\n"

echo -e "+-------------------------------------------------+"
echo -e "|  		Installing php			   |"
echo -e "+-------------------------------------------------+"
echo

# check if "php" package is installed or not
PACKAGE_NAME=php
check_install_package

echo -e "+-------------------------------------------------+"
echo -e "|         checking php configuration files        |"
echo -e "+-------------------------------------------------+"
echo

# checking for php.conf file
FILE_NAME=php.conf
FILE_PATH=/etc/httpd/conf.d
check_file_status

# checking for php.ini file
FILE_NAME=php.ini
FILE_PATH=/etc
check_file_status

# creating php file for test under /var/www/html

cat > /var/www/html/test.php<<EOF
<?php
echo "Today is " . date("d-m-y") . "<br>";
echo "Today is " . date("l") . "<br>";
echo "Today is " . date("h:i:sa") . "<br>";
?>
EOF

# check if "test.php" page is created under /var/www/html
FILE_NAME=test.php
FILE_PATH=/var/www/html
check_file_status

# Check the page in the browser
APPLICATION_PORT=httpd
echo -e "Please ues below address in the browser to check setup ...\n"

# Printing the coloured output "\e[34m"
echo -e "\e[34m $(application_address)/test.php \e[0m \n" 	# application_address is a function call

echo -e "\n\t* * * Installation/configuration completed for "php" service * * *\n"

sleep 10

