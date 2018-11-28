# Set path 
cd /epeverlogger

# Mount virtual Device 
# If no $EBOX_IP then default to 192.168.9.11

if [ -z "$EBOX_IP" ]
        then export EBOX_IP=192.168.9.11
fi

socat pty,link=/dev/ttyUSB21,unlink-close=0,raw,echo=0 tcp:$EBOX_IP:8088&

# echo date and first logger run
date
php logger.php 

# Main loop - hide output
# Delay set to $POLLING_DELAY
while :
do
        if [ -z "$POLLING_DELAY" ]
                then sleep 0
                else sleep $POLLING_DELAY
        fi
        
        php -q logger.php > /dev/null

done
