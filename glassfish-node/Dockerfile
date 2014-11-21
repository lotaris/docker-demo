FROM lotaris/glassfish-srv

USER root

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 8080 4848

VOLUME /supervisor
VOLUME /glassfish4/glassfish/domains/domain1

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
