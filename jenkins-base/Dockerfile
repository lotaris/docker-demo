FROM lotaris/glassfish-base

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local
