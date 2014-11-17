FROM 63f27e1fc274

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

VOLUME /var/lib/jenkins
