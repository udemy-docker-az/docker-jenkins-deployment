usermod -a -G $(ls -la /var/run/docker.sock | awk '{ print $4 }') jenkins

chown -R jenkins:jenkins /var/jenkins_home 

su -c /usr/local/bin/jenkins.sh jenkins
