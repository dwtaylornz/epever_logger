# Set path 
cd /epeverlogger

# Set default variables
# If no $EBOX_IP then default to 192.168.9.11
if [ -z "$EBOX_IP" ]
        then export EBOX_IP=192.168.9.11
fi
# If no $POLLING_DELAY then default to 0 
if [ -z "$POLLING_DELAY" ]
        then export POLLING_DELAY=0
fi

# Mount virtual Device 
socat pty,link=/dev/ttyUSB21,unlink-close=0,raw,echo=0 tcp:$EBOX_IP:8088&

# echo date, variables and first logger run
date
echo POLLING_DELAY = $POLLING_DELAY
echo EBOX_IP = $EBOX_IP
php logger.php 

# Main loop - hide output
# Delay set to $POLLING_DELAY
while :
do
        sleep $POLLING_DELAY
        php -q logger.php > /dev/null

done
