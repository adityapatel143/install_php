# :tulip: install_php
process to install php on the Centos7

Prerequsit
-----------------
httpd should be installed on the centos7

Installing php
-----------------
  _sudo yum -y install php_
  
Checking the php version
------------------------
  _php -v_   OR    _php --version_
  
Testing
-----------------------

	1. create php file in "/var/www/html/"
			Ex.
			A. sudo vi /var/www/html/dynamic.php
			B. insert below lines
					<?php
					echo "Today is " . date("d-m-y") . "<br>";
					echo "Today is " . date("l") . "<br>";
					echo "Today is " . date("h:i:sa") . "<br>";
					?>
		C. save and close it

	2. Refresh the page in the browser
		<ip>:<port>/dynamic.php

Debugging (if page is not displayed)
--------------------------
:pushpin: php may not be installed correctly
		_`php --version`_
		
:pushpin: "php.conf" is not available to httpd
		_`ls -l /etc/httpd/conf.d/php.conf`_

:pushpin: "php.ini" file may not be available
		_`ls -l /etc/php.ini`_

Note: Restart the "httpd" to detect the changes in the php configuration
	_`sudo systemctl restart httpd.service`_

Additional
-----------------------
Change the time zone
		
		sudo vi /etc/php.ini
		date.timezone=<your country time zone>
		EX. date.timezone="Asia/Kolkata" for IST
		
Checking the syntax after changing in the files

		httpd -t
		
# :palm_tree:
