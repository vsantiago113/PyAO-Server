# [AWX](https://github.com/ansible/awx 'AWX')
##### AWX provides a web-based user interface, REST API, and task engine built on top of Ansible. It is the upstream project for Tower, a commercial derivative of AWX.
[Installation Guide](https://github.com/ansible/awx/blob/devel/INSTALL.md 'Installation Guide')

---

### The server I am using is CentOS 8
I will be installing AWX on a Docker container.

---

### System Requirements
The system that runs the AWX service will need to satisfy the following requirements
* At least 4GB of memory
* At least 2 cpu cores
* At least 20GB of space
* Running Docker, Openshift, or Kubernetes
* If you choose to use an external PostgreSQL database, please note that the minimum version is 10+.

---

## Linux Requirements
* [Python](https://www.python.org/ 'Python') 3+
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html 'Ansible') Requires Version 2.8+
* [Docker](https://docs.docker.com/engine/install/ 'Docker') - A recent version
* [Docker-Compose](https://docs.docker.com/compose/install/ 'Docker-Compose') - A recent version
* [Git](https://git-scm.com/ 'Git') - A recent version
* [MAKE](https://www.gnu.org/software/make/ 'MAKE')

## Python Requirements
* [Requests](https://pypi.org/project/requests/ 'Requests')
* [Ansible](https://pypi.org/project/ansible/ 'Ansible')
* [Docker](https://pypi.org/project/docker/ 'Docker')
* [Docker-Compose](https://pypi.org/project/docker-compose/ 'Docker-Compose')
* [Node 10.x LTS version](https://nodejs.org/en/download/ 'Node 10.x LTS version')
* [NPM 6.x LTS](https://docs.npmjs.com/ 'NPM 6.x LTS')
---

## Lets setup some directories on the server
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

- [X] Lets update the server
```
$ sudo dnf update -y
```

## Lets install the Linux Dependencies

- [X] Make sure SELinux is disabled
```
$ sestatus
```

- [X] If SELinux is enable then lets disable it
```
$ sudo sed -i /etc/selinux/config -r -e 's/^SELINUX=.*/SELINUX=disabled/g'
$ sudo reboot
```

- [X] Lets install MAKE and the compilers
```
$ sudo dnf groupinstall -y "Development Tools"
```

- [X] Lets update the DNF package repository cache
```
$ sudo dnf makecache
```

- [X] Lets update the server again
```
$ sudo dnf update -y
```

- [X] Lets install the epel-release package
NOTE: This might not be available on your system
```
$ sudo dnf install epel-release
```

#### Lets install wget
```
$ sudo dnf install -y wget
```

#### Lets install Python3 and some dependencies
```
$ sudo dnf install -y python3 python3-devel python3-pip
```

#### Lets install Git
```
$ sudo dnf install -y git
```

#### Lets install Docker
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
$ sudo systemctl start docker
$ sudo systemctl status docker
```

#### Lets install Docker-Compose
- [X] NOTE: To install a different version of Compose, substitute 1.27.4 with the version of Compose you want to use. To check the latest version, go to docker/compose - GitHub

- [X] Run this command to download the current stable release of Docker Compose
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

- [X] Apply executable permissions to the binary:
```
$ sudo chmod +x /usr/local/bin/docker-compose
```

- [X] Create a symbolic link to /usr/bin or any other directory in your path.
```
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

#### Steps to install Ansible on EC2 instance [RHEL-8]
```
$ sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
$ sudo dnf config-manager --set-enabled codeready-builder-for-rhel-8-rhui-rpms
$ sudo dnf install -y ansible
$ ansible --version
```

#### Lets install Node.js with Node Package Manager (NPM)
```
$ sudo dnf install -y nodejs
```

## Lets install all Python requirements
```
$ pip3 install requests ansible docker docker-compose
```

# Start AWX installation

- [X] Clone the latest stable [release](https://github.com/ansible/awx/releases 'Releases')
```
$ cd /etc/container_data/compose_files
```
```
$ git clone -b 15.0.1 https://github.com/ansible/awx.git
```

- [X] Run the Ansible playbook
```
$ cd /etc/container_data/compose_files/awx/installer
```
```
$ ansible-playbook -i inventory install.yml
```

## Post-install
After the playbook run completes, Docker starts a series of containers that provide the services that make up AWX. You can view the running containers using the docker ps command.<br />

If you're deploying using Docker Compose, container names will be prefixed by the name of the folder where the docker-compose.yml file is created (by default, awx).<br />

Immediately after the containers start, the awx_task container will perform required setup tasks, including database migrations. These tasks need to complete before the web interface can be accessed. To monitor the progress, you can follow the container's STDOUT by running the following:<br />
```
$ sudo docker logs -f awx_task
```

- [X] Access your server at http://127.0.0.1

- [X] After AWX is installed, you can log in with the default username admin and password password.
