### Server configs for Vault container

Create the vault root directory
```bash
$ sudo mkdir /etc/vault
```

Create vault config folder where the config file will be stored
```bash
$ sudo mkdir /etc/vault/config
```

Create the vault config file
```bash
sudo vi /etc/vault/config/config.hcl
```

Add the following code inside the config.hcl file
```bash
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
