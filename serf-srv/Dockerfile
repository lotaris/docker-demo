FROM ansible/centos7-ansible:stable

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 7946 7373

VOLUME /supervisor

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
