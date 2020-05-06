### Official Documentation
[Portainer Official Documentation](https://portainer.readthedocs.io/en/stable/deployment.html "Portainer Official Documentation")

---

### Run Portainer as a Docker container over SSL
- [X] Create Portainer root and data directories
```
$ sudo mkdir -p /etc/container_data/portainer/data
```

- [X] Lets create the network for Portainer and all other containers
```
$ sudo docker network create pyao_network
```

- [X] Lets store the Docker-Compose file in the server
```
$ sudo vi /etc/container_data/compose_files/portainer-docker-compose.yml
```

- [X] Lets create the container
```
$ sudo docker-compose -f /etc/container_data/compose_files/portainer-docker-compose.yml -p Portainer up -d
```
