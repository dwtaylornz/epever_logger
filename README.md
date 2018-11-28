# epever_logger

A docker contianer image that has PHP scripts & libraries that pulls data from virtual serial connection and inserts into inFluxDB for Grafana

Variables 
-------
POLLING_DELAY = how long in seconds to delay between fetch requests (null or 0 will poll as fast as possible) 

Requires
-------
 
* eBox WIFI adapter - in station mode (for communication) 
* inFluxDB - to hold data (with "powerwall" db created)
* Grafana - to display data 
