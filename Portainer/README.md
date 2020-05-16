### Official Documentation
[Portainer Official Documentation](https://portainer.readthedocs.io/en/stable/deployment.html "Portainer Official Documentation")

---

### Run Portainer as a Docker container
- [X] Lets store the Docker-Compose file in the server.
```
$ sudo vi /etc/container_data/compose_files/portainer-docker-compose.yml
```

- [X] If you plan to use SSL outside of NGINX reverse proxy then create the certificates to use SSL with Portainer.
```ignorelang
$ sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/container_data/certs/portainer.key -out /etc/container_data/certs/portainer.crt -batch
```

- [X] Lets create the container or run the second command if you want to run over SSL ouside of NGINX reverse proxy
```ignorelang
$ sudo docker-compose -f /etc/container_data/compose_files/portainer-docker-compose.yml -p Portainer up -d
```
```ignorelang
$ sudo docker-compose -f /etc/container_data/compose_files/ssl_portainer-docker-compose.yml -p Portainer up -d
```
