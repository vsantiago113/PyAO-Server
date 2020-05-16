### Official Documentation
[Grafana Docker images](https://grafana.com/docs/grafana/latest/installation/docker/ "Grafana Docker images")<br />
[InfluxDB Docker Official Images](https://hub.docker.com/_/influxdb "InfluxDB Docker Official Image")<br />
[Installing Telegraf](https://docs.influxdata.com/telegraf/v1.14/introduction/installation "Installing Telegraf")<br />
[Telegraf Download page](https://portal.influxdata.com/downloads/ "Telegraf Download page")

---

- [X] Lets create our volumes
```ignorelang
$ sudo docker volume create grafana_data
$ sudo docker volume create influxdb_data
```

- [X]
```ignorelang
$ sudo docker run --rm \
      -e INFLUXDB_DB=telegraf \
      -e INFLUXDB_ADMIN_USER=admin -e INFLUXDB_ADMIN_PASSWORD=supersecretpassword \
      -e INFLUXDB_USER=telegraf -e INFLUXDB_USER_PASSWORD=secretpassword \
      -v influxdb_data:/var/lib/influxdb \
      influxdb /init-influxdb.sh
```

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the grafana-docker-compose.yml and then click on "Deploy the stack".

- [X] Lets add InfluxDB as a data source in Grafana
Login in Grafana -> Configuration -> Data Sources -> Add data source -> Select InfluxDB

###### Fill out the following fields for the Data Source
1. name = influxDB
2. URL = http://influxdb:8086
3. Database = telegraf
4. User = telegraf
5. Password = secretpassword
HTTP Method = GET

- [X] Download and Install Telegraf on the server you want to monitor
Go to the [Telegraf Download page](https://portal.influxdata.com/downloads/ "Telegraf Download page") and check what is the latest version<br />

- Download
```ignorelang
$ wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.2-1.x86_64.rpm
```
- Install
```ignorelang
$ sudo dnf localinstall -y telegraf-1.14.2-1.x86_64.rpm
```

- Lets configure Telegraf
```ignorelang
$ sudo vi /etc/telegraf/telegraf.conf
```

- Find and uncomment the following lines and change the parameters if necessary
```ignorelang
# urls = ["http://127.0.0.1:8086"]
# database = "telegraf"
# skip_database_creation = false
# username = "telegraf"
# password = "metricsmetricsmetricsmetrics"
```

- The above lines in the config should now look like this
```
urls = ["http://127.0.0.1:8086"]
database = "telegraf"
skip_database_creation = true
username = "telegraf"
password = "secretpassword"
```

- Lets enable the service
```ignorelang
$ sudo systemctl enable telegraf
```

- Lets start the service
```ignorelang
$ sudo systemctl start telegraf
```

- Lets check the status of the service
```ignorelang
$ sudo systemctl status telegraf
```

- [X] Lets create a dashboard and start monitoring our Automation Server
Login in Grafana -> Create -> Import -> Dashboard ID = 61 -> Folder = General -> InfluxDB = InfluxDB -> Click Import