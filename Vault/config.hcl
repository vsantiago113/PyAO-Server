listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}
storage "file" {
    path  = "/etc/vault/data"
}
api_addr = "http://0.0.0.0:8200"
ui = true
disable_mlock = true
disable_cache = true
max_lease_ttl = "10h"
default_lease_ttl = "10h"