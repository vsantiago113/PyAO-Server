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

## Python Requirements
* [Requests](https://pypi.org/project/requests/ 'Requests')
* [Ansible](https://pypi.org/project/ansible/ 'Ansible')
* [Docker](https://pypi.org/project/docker/ 'Docker')
* [Docker-Compose](https://pypi.org/project/docker-compose/ 'Docker-Compose')
