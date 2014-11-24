FROM ansible/centos7-ansible:stable

ADD ansible /ansible/
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 80

VOLUME /nginx
VOLUME /supervisor
VOLUME /etc/nginx/sites-enabled

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
