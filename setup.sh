mkdir epeverlogger
cd epeverlogger

# Get packages
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.3.4_amd64.deb 
wget https://dl.influxdata.com/influxdb/nightlies/influxdb_nightly_amd64.deb
wget https://github.com/toggio/PhpEpsolarTracer/archive/master.zip
wget https://github.com/chickey/Epever-influxdb/raw/master/logger.php

dpkg -i grafana_5.3.4_amd64.deb 
dpkg -i influxdb_nightly_amd64.deb
apt-get -f -y install 

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer require influxdb/influxdb-php

unzip -j master.zip

socat pty,link=/dev/ttyUSB21,unlink-close=0,raw,echo=0 tcp:192.168.9.11:8088&
chmod 777 /dev/ttyUSB21




