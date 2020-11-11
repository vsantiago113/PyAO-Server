# PyAO-Server
Automation and Orchestration Server

## Install the operating system
We are using CentOS 8 as a minimal server installation

## Optional - Examples of configuring Proxy
- [X] Example 1:
```
$ export http_proxy=http://proxy.offensivescripting.com:3128
```
```
$ export proxy_username=myusername
```
```
$ export proxy_username=mypassword
```

- [X] Example 2: Add the proxy configs in the yum.conf file
```
$ sudo vi /etc/yum.conf
```
```
proxy=http://proxy.offensivescripting.com:3128
proxy_username=myusername 
proxy_password=mypassword
```

- [X] Example 3: Add the proxy configs in our custom_global_configs.sh file
```
$ sudo vi /etc/profile.d/custom_global_configs.sh
```
```
export http_proxy=http://proxy.offensivescripting.com:3128
export proxy_username=myusername
export proxy_username=mypassword
```

## Prepare the server
- [X] Lets update the server
```
$ sudo dnf -y update
```

- [X] Lets disable SELinux
```
$ sudo sed -i /etc/selinux/config -r -e 's/^SELINUX=.*/SELINUX=disabled/g'
```

- [X] Reboot the server
```
$ sudo reboot
```

- [X] Make sure SELinux is disabled
```
$ sestatus
```

- [X] Lets create the file where we are going to store our global environment variables
```
$ sudo touch /etc/profile.d/custom_global_configs.sh
```

- [X] Lets create the directory where we are going to store all the data from all our containers.
```
$ sudo mkdir /etc/container_data
```

- [X] Lets create a directory to store all the certificates
```
$ sudo mkdir /etc/container_data/certs
```

- [X] Lets create a directory to store all Docker-Compose files
```
$ sudo mkdir /etc/container_data/compose_files
```

## Lets install wget
```ignorelang
$ sudo dnf install -y wget
```

## Lets install Python3
```
$ sudo dnf install -y python3
```

- [X] Lets install some dependencies
```
$ sudo dnf install -y python3-devel
```

- [X] Check if Python3 was installed successfully
```
$ python3 --version
```

- [X] Check if pip is installed
```
$ pip3 --version
```

- [X] Or you can also try
```
$ pip3 list
```

## Lets install Git
```
$ sudo dnf install -y git
```

- [X] Lets check if Git was installed
```
$ git --version
```

## Lets install Docker
#### Setup Repository
- [X] Install required packages. yum-utils provides the yum-config-manager utility, and device-mapper-persistent-data and lvm2 are required by the devicemapper storage driver.
```
$ sudo dnf install -y dnf-utils \
  device-mapper-persistent-data \
  lvm2
```

- [X] Use the following command to set up the stable repository.
```
$ sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

- [X] Install Docker Engine - Community<br />
- [X] Note: If prompted to accept the GPG key, verify that the fingerprint matches 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35, and if so, accept it.
```
$ sudo dnf -y install docker-ce docker-ce-cli containerd.io --nobest --allowerasing
```

- [X] Make Docker start automatically on boot
```
$ sudo systemctl enable docker
```

- [X] Start Docker
```
$ sudo systemctl start docker
```

- [X] Make sure Docker is running
```
$ sudo systemctl status docker
```

- [X] Verify that Docker Engine - Community is installed correctly by running the hello-world image.
```
$ sudo docker run hello-world
```

- [X] Make sure the container was created
```
$ sudo docker ps -a
```

#### Optional
- [X] If you would like to use Docker as a non-root user, you should now consider adding your user to the “docker” group with something like:
```
$ sudo usermod -aG docker your-user
```
- [X] Note: Remember to log out and back in for this to take effect!

## Lets install Docker-Compose
- [X] NOTE: To install a different version of Compose, substitute 1.25.5 with the version of Compose you want to use. To check the latest version, go to docker/compose - GitHub

- [X] Run this command to download the current stable release of Docker Compose
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

- [X] Apply executable permissions to the binary:
```
$ sudo chmod +x /usr/local/bin/docker-compose
```

- [X] Create a symbolic link to /usr/bin or any other directory in your path.
```
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

- [X] Test the installation.
```
$ docker-compose --version
```

- [X] IMPORTANT NOTE: create the docker containers in the following order
1. NGINX Reverse Proxy
2. Portainer
3. Create the rest of the containers...
