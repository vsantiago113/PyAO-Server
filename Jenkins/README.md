### Official Documentation
[Jenkins in Docker](https://www.jenkins.io/doc/book/installing/ "Jenkins in Docker")

---

- [X] Go in Portainer > Stacks > Add stack > give it a name and under Web editor paste the content of the jenkins-docker-compose.yml and then click on "Deploy the stack"

- [X] After Jenkins is running go to http://[server ip]:8080 and then execute the folowing command to get the initial password.
```
sudo docker container exec jenkins \
	sh -c "cat /var/jenkins_home/secrets/initialAdminPassword"
```

- [X] Another way to get the password is from Portainer.
Portainer > Containers > jenkins > ">_Console" > Change command to "bin/sh" > Connect > "cat /var/jenkins_home/secrets/initialAdminPassword"

- [X] NOTE: Jenkins is using a Docker Volume unlike the other containers which are bind to a directory in our automation server on "/etc/container_data"
