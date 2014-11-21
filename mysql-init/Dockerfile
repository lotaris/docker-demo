FROM lotaris/mysql-srv

ADD ansible /ansible
WORKDIR /ansible

ENTRYPOINT ["ansible-playbook", "play.yml", "-c", "local"]
