FROM 76c69b9c93c3

ADD ansible /ansible
WORKDIR /ansible

VOLUME /data

ENTRYPOINT ["ansible-playbook", "play.yml", "-c", "local"]
