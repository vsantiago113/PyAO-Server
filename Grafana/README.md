### Official Documentation
[Grafana Docker images](https://grafana.com/docs/grafana/latest/installation/docker/ "Grafana Docker images")<br />
[InfluxDB Docker Official Images](https://hub.docker.com/_/influxdb "InfluxDB Docker Official Image")<br />
[Telegraf Docker Official Images](https://hub.docker.com/_/telegraf "Telegraf Docker Official Images")

---

- [X]
```ignorelang
$ docker run --rm \
      -e INFLUXDB_DB=db0 \
      -e INFLUXDB_ADMIN_USER=admin -e INFLUXDB_ADMIN_PASSWORD=supersecretpassword \
      -e INFLUXDB_USER=telegraf -e INFLUXDB_USER_PASSWORD=secretpassword \
      -v influxdb_data:/var/lib/influxdb \
      influxdb /init-influxdb.sh
```

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the grafana-docker-compose.yml and then click on "Deploy the stack".

- [X] Lets add InfluxDB as a data source in Grafana
Login in Grafana -> Configuration -> Data Sources -> Add data source -> Select InfluxDB