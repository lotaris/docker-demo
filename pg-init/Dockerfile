FROM lotaris/pg-srv

ADD ansible /ansible
WORKDIR /ansible

VOLUME /data

ENTRYPOINT ["ansible-playbook", "play.yml", "-c", "local"]
