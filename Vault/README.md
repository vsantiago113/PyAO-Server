### Official Documentation
[Vault Docker Hub](https://hub.docker.com/_/vault "Vault Docker Image Documentation")<br />
[Vault Official Documentation](https://www.vaultproject.io/docs "Vault Official Documentation")

---

- [X] Lets create the SSL certificates
```ignorelang
$ sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/container_data/certs/vault.offensivescripting.com.key -out /etc/container_data/certs/vault.offensivescripting.com.crt -batch
```

- [X] Lets create the vault.conf for NGINX reverse proxy to redirect to https://vault.offensivescripting.com
Lets create the vault.conf file and paste the content in it.
```ignorelang
$ sudo vi /etc/container_data/reverse_proxy/conf.d/vault.conf
```

### Server configs for Vault container
- [X] Create Vault root and config directories
```
$ sudo mkdir -p /etc/container_data/vault/config
```

- [X] Create the vault config file
```
$ sudo vi /etc/container_data/vault/config/config.hcl
```

- [X] Add the following code inside the config.hcl file
```
listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}
storage "file" {
    path  = "/vault/file"
}
api_addr = "http://0.0.0.0:8200"
ui = true
disable_mlock = true
disable_cache = true
max_lease_ttl = "10h"
default_lease_ttl = "10h"
```

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the vault-docker-compose.yml and then click on "Deploy the stack"
