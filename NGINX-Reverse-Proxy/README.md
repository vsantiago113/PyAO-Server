### Official Documentation
[NGINX Docker Official Images](https://hub.docker.com/_/nginx "NGINX Docker Official Images")

---

- [X] Lets create the SSL certificates
```ignorelang
$ sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/container_data/certs/offensivescripting.com.key -out /etc/container_data/certs/offensivescripting.com.crt -batch
```

- [X] Lets create the base.conf for NGINX reverse proxy to redirect to https://offensivescripting.com
Lets create the base.conf file and paste the content in it.
```ignorelang
$ sudo vi /etc/container_data/reverse_proxy/conf.d/base.conf
```

- [X] Lets create the nginx.conf default configuration file for NGINX
```ignorelang
$ sudo docker container create --name temp_nginx nginx
```

- [X] Lets copy the nginx.conf file and the mime.types file from the temp_nginx container to the external location we want to use
```ignorelang
$ sudo docker cp temp_nginx:/etc/nginx/nginx.conf /etc/container_data/reverse_proxy/nginx.conf
$ sudo docker cp temp_nginx:/etc/nginx/mime.types /etc/container_data/reverse_proxy/mime.types
```

-[X] Lets remove the temp_nginx container
```ignorelang
$ sudo docker container rm temp_nginx
```

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the nginx-docker-compose.yml and then click on "Deploy the stack"
