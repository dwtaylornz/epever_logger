# Set path 
cd /epeverlogger

# Mount virtual Device 
socat pty,link=/dev/ttyUSB21,unlink-close=0,raw,echo=0 tcp:192.168.9.11:8088&
# sleep 5 
# chmod 777 /dev/ttyUSB21

# echo date and first logger run
date
php logger.php 

# Main loop - hide output
while :
do
        # sleep 0 
        php -q logger.php > /dev/null
done
