### Official Documentation
[GitLab Docker images](https://docs.gitlab.com/omnibus/docker/ "GitLab Docker images")

---

- [X] Lets create the SSL certificates.
```ignorelang
$ sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/container_data/certs/gitlab.mechanizecode.com.key -out /etc/container_data/certs/gitlab.mechanizecode.com.crt -batch
```

- [X] Lets create the gilab.conf for NGINX reverse proxy to redirect to https://gitlab.mechanizecode.com.
Lets create the gitlab.conf file and paste the content in it.
```ignorelang
$ sudo vi /etc/container_data/reverse_proxy/conf.d/gitlab.conf
```

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the gitlab-docker-compose.yml and then click on "Deploy the stack".

- [X] NOTE: GitLab can take up to 10 minutes to fully start up the first time.