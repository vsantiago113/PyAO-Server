### Official Documentation
[Netbox Docker](https://github.com/netbox-community/netbox-docker/wiki/Getting-Started "Netbox Docker")

---

- [X] Go into our containers directory
```
$ cd /etc/container_data
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
$ sudo vi /etc/container_data/netbox-docker/docker-compose.override.yml
```

- [X] Paste the following data in the file
```
version: '3.4'
services:
  nginx:
    ports:
    - 8585:8080
```

- [X] Download all the images
```
$ sudo docker-compose pull
```

- [X] Lets start our containers
```
$ sudo docker-compose up
```
