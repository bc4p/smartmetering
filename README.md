# smartmetering

This is a Smartmetering Stack consisting of MQTT, Telegraf, InfluxDB 1.8 and Grafana.
It can be used to monitor the power usage of virtually any device with internet access and a configurable MQTT Broker.

For a public monitoring solution, the MQTT broker has to be accessible from the internet.

Add a .env file like this:

```
INFLUXDB_PASSWORD="XXX"
INFLUX_USER_PASSWORD="USER_PASSWORD"
```

## MQTT

The MQTT broker is installed using a given user.
To change the user/password, one can run `passwd` and create a new user/password pair.

The ACL is used to deny changing relays for Shelly or Tasmota devices as this is a large security issue

## Telegraf

Telegraf consumes messages sent on MQTT topics.
The configuration allows to connect arbitrary Shelly or Tasmota devices and writes the data into the InfluxDB.

This configuration is the heart of this repository as I could not find such a configuration for Tasmota to Influxdb elsewhere.

## InfluxDB

The InfluxDB is a timeseries database which is used to store the values of the power usage.

## Grafana

Grafana is a visualization tool, which allows to cocnfigure dashboards with interesting information through a very rich User-Interface.
It accesses the data from InfluxDB.

## Further Development

The messages sent from the devices can not be verified, as these devices do not support MQTT over Websockets (WS) which could be used with TLS.
Therefore, using signed meter values can be helpful to verify the integrity of the data.
A private/public key pair must be installed on those devices with a custom firmware.
The public key must be exchanged on installation.
After this, the integrity of the reported values can be controlled.

This concept is currently used for german chargingstations (Eichrecht).

