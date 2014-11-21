FROM lotaris/java-serf

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local
