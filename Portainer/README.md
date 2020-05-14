### Official Documentation
[Portainer Official Documentation](https://portainer.readthedocs.io/en/stable/deployment.html "Portainer Official Documentation")

---

### Run Portainer as a Docker container
- [X] Lets store the Docker-Compose file in the server
```
$ sudo vi /etc/container_data/compose_files/portainer-docker-compose.yml
```

- [X] Lets create the certificates to use SSL with Portainer
```ignorelang
$ openssl genrsa -out /etc/container_data/certs/portainer.key 2048
$ openssl ecparam -genkey -name secp384r1 -out /etc/container_data/certs/portainer.key
$ openssl req -new -x509 -sha256 -key /etc/container_data/certs/portainer.key -out /etc/container_data/certs/portainer.crt -days 3650
```

- [X] Lets create the container
```
$ sudo docker-compose -f /etc/container_data/compose_files/portainer-docker-compose.yml -p Portainer up -d
```
