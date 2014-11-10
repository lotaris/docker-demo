FROM ansible/centos7-ansible:stable

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 6379

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/bin/su", "redis", "-c", "redis-server"]
