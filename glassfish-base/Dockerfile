FROM 3ad17156d715

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 8080
EXPOSE 4848

VOLUME /glassfish4/glassfish/domains/domain1
