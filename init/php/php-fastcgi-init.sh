#!/bin/bash

#
# Start daemon at boot time
#                                                                                                               
# provides:          php-fastcgi                                                                                                        
# required-start:    $remote_fs $syslog                                                                                                 
# required-stop:     $remote_fs $syslog                                                                                                 
# default-start:     2 3 4 5                                                                                                            
# default-stop:      0 1 6                                                                                                              
#


if [ `grep -c "nginx" /etc/passwd` = "1" ]; then 
    FASTCGI_USER=nginx
elif [ `grep -c "www-data" /etc/passwd` = "1" ]; then 
    FASTCGI_USER=www-data
elif [ `grep -c "http" /etc/passwd` = "1" ]; then 
    FASTCGI_USER=http
else
    # Set the FASTCGI_USER variable below to the user that 
    # you want to run the php-fastcgi processes as
    FASTCGI_USER=
fi


PHP_SCRIPT=/usr/bin/php-fastcgi
RETVAL=0
case "$1" in
    start)
        sudo -u $FASTCGI_USER $PHP_SCRIPT
        RETVAL=$?
        ;;
    stop)
        killall -9 php5-cgi
        RETVAL=$?
        ;;
    restart)
        killall -9 php5-cgi
        sudo -u $FASTCGI_USER $PHP_SCRIPT
        RETVAL=$?
        ;;
    *)
        echo "Usage: php-fastcgi {start|stop|restart}"
        exit 1
        ;;
esac    

exit $RETVAL
