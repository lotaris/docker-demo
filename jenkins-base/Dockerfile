FROM 119c39cd7419

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

VOLUME /var/lib/jenkins
