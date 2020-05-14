### Official Documentation
[NGINX Docker Official Images](https://hub.docker.com/_/nginx "NGINX Docker Official Images")

---

- [X] Lets create the nginx.conf file for NGINX
```ignorelang
$ sudo docker container create --name temp_nginx nginx
```

- [X] Lets copy the nginx.conf file from the temp_nginx container to the external location we want to use
```ignorelang
$ sudo docker cp temp_nginx:/etc/nginx/nginx.conf /etc/container_data/reverse_proxy/nginx.conf
$ sudo docker cp temp_nginx:/etc/nginx/mime.types /etc/container_data/reverse_proxy/mime.types
```

-[X] Lets remove the temp_nginx container
```ignorelang
$ sudo docker container rm temp_nginx
```

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the nginx-docker-compose.yml and then click on "Deploy the stack"