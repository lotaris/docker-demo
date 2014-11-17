FROM 3ad17156d715

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

VOLUME /glassfish4/glassfish/domains/domain1
