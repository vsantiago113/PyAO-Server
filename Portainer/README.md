### Official Documentation
[Portainer Official Documentation](https://portainer.readthedocs.io/en/stable/deployment.html "Portainer Official Documentation")

---

### Run Portainer as a Docker container
- [X] Lets store the Docker-Compose file in the server.
```
$ sudo vi /etc/container_data/compose_files/portainer-docker-compose.yml
```

- [X] Lets create the certificates to use SSL with Portainer.
```ignorelang
$ sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/container_data/certs/portainer.key -out /etc/container_data/certs/portainer.crt -batch
```

- [X] Lets create the container
```
$ sudo docker-compose -f /etc/container_data/compose_files/portainer-docker-compose.yml -p Portainer up -d
```

- [X] Lets create the docker network named "automation_network" to connect all our containers thought our reverse proxy.
- [X] Go in Portainer -> Networks -> Add network -> name = automation_network -> Create the network
