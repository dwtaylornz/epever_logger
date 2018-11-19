
FROM debian:jessie
MAINTAINER dwtaylornz@gmail.com

# Update and Install Pre-reqs
RUN apt-get update && apt-get install -y \
  apt-transport-https curl wget socat unzip \
  php5-fpm php5-curl

# Add setup and init scripts 
ADD setup.sh /
ADD init.sh /

# Install 
RUN bash setup.sh

# Volumes
# VOLUME /var/lib/unifi-video  
# VOLUME /var/log/unifi-video

# Ports
# EXPOSE 7442 7443 7445 7446 7447 7080 6666

# start loggger
CMD ["sh","/init.sh"]
