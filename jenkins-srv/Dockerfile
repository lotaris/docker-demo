FROM lotaris/jenkins-base

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 8080

VOLUME /var/lib/jenkins
VOLUME /glassfish4
VOLUME /supervisor
VOLUME /glassfishNodes

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
