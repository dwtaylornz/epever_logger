# Set path 
cd /epeverlogger

# Mount virtual Device 
socat pty,link=/dev/ttyUSB21,unlink-close=0,raw,echo=0 tcp:192.168.9.11:8088&
chmod 777 /dev/ttyUSB21

date

# Main loop 
while :
do
        # sleep 0 
        php -q logger.php
done
