FROM eb88272d9982

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 8080

USER jenkins

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-DJENKINS_HOME=/var/lib/jenkins", "-jar", "/usr/lib/jenkins/jenkins.war"]
