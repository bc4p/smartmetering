#!/bin/bash
source .env
sleep 5
docker compose exec influxdb influx -username telegraf -password XYEMEcVUc9TcGnL8DkQB -execute "CREATE USER bc4p WITH PASSWORD $INFLUX_USER_PASSWORD"
docker compose exec influxdb influx -username telegraf -password XYEMEcVUc9TcGnL8DkQB -execute 'GRANT READ ON "telegraf" TO "bc4p"'

docker compose exec influxdb influx -username telegraf -password XYEMEcVUc9TcGnL8DkQB -execute "CREATE USER bc4p_write WITH PASSWORD $INFLUX_USER_PASSWORD"
docker compose exec influxdb influx -username telegraf -password XYEMEcVUc9TcGnL8DkQB -execute 'GRANT ALL ON "telegraf" TO "bc4p_write"'
