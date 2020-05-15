### Official Documentation
[Netbox Docker](https://github.com/netbox-community/netbox-docker/wiki/Getting-Started "Netbox Docker")

---

- [X] Lets create the SSL certificates
```ignorelang
$ sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/container_data/certs/netbox.offensivescripting.com.key -out /etc/container_data/certs/netbox.offensivescripting.com.crt -batch
```

- [X] Lets create the netbox.conf for NGINX reverse proxy to redirect to https://netbox.offensivescripting.com
Lets create the netbox.conf file and paste the content in it.
```ignorelang
$ sudo vi /etc/container_data/reverse_proxy/conf.d/netbox.conf
```

- [X] Go into our containers directory
```
$ cd /etc/container_data/compose_files
```

- [X] Download the Netbox Docker Repo
```
$ sudo git clone -b release https://github.com/netbox-community/netbox-docker.git
```

- [X] Lets go inside the netbox-docker directory
```
$ cd netbox-docker
```

- [X] Create an override file to change nginx port
```
$ sudo vi /etc/container_data/compose_files/netbox-docker/docker-compose.override.yml
```

- [X] Paste the following data in the file
```
version: '3.4'
services:
  nginx:
    ports:
    - 8585:8080

```

- [X] Lets start our containers
```
$ sudo docker-compose up -d
```
