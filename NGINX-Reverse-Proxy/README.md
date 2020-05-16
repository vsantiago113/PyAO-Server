### Official Documentation
[NGINX Docker Official Images](https://hub.docker.com/_/nginx "NGINX Docker Official Images")

---

- [X] Lets create the SSL certificates for all our applications
NGINX Reverse Proxy
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/offensivescripting.com.key -out /etc/pki/tls/certs/offensivescripting.com.crt -batch
```

Portainer
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/portainer.offensivescripting.com.key -out /etc/pki/tls/certs/portainer.offensivescripting.com.crt -batch
```

GitLab
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/gitlab.offensivescripting.com.key -out /etc/pki/tls/certs/gitlab.offensivescripting.com.crt -batch
```

Jenkins
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/jenkins.offensivescripting.com.key -out /etc/pki/tls/certs/jenkins.offensivescripting.com.crt -batch
```

Netbox
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/netbox.offensivescripting.com.key -out /etc/pki/tls/certs/netbox.offensivescripting.com.crt -batch
```

Vault
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/vault.offensivescripting.com.key -out /etc/pki/tls/certs/vault.offensivescripting.com.crt -batch
```

Grafana
```ignorelang
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/grafana.offensivescripting.com.key -out /etc/pki/tls/certs/grafana.offensivescripting.com.crt -batch
```

- [X] Lets assign the permissions to the certificates
```ignorelang
$ sudo chown -R root:root /etc/pki/tls/private
```
Or you can also do
```ignorelang
$ find /etc/pki/tls/certs -type f -exec chmod 0600 {} \;
```

- [X] Lets create the .conf files to redirect our containers to use SSL thought our reverse proxy with NGINX
Copy the content of the file from our conf.d folder into the server /etc/nginx/conf.d/xxx.conf file
NGINX Reverse Proxy
```ignorelang
$ sudo vi /etc/nginx/conf.d/base.conf
```

Portainer
```ignorelang
$ sudo vi /etc/nginx/conf.d/portainer.conf
```

GitLab
```ignorelang
$ sudo vi /etc/nginx/conf.d/gitlab.conf
```

Jenkins
```ignorelang
$ sudo vi /etc/nginx/conf.d/jenkins.conf
```

Netbox
```ignorelang
$ sudo vi /etc/nginx/conf.d/netbox.conf
```

Vault
```ignorelang
$ sudo vi /etc/nginx/conf.d/vault.conf
```

Grafana
```ignorelang
$ sudo vi /etc/nginx/conf.d/grafana.conf
```

- [X] Reload the NGINX Config
```ignorelang
$ sudo systemctl reload nginx
```

- [X] Make sure the config loaded without errors
```ignorelang
$ sudo nginx -t
```
