FROM 4f57b7725276

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 8080
EXPOSE 4848

VOLUME /glassfish4/glassfish/domains/domain1

USER glassfish

ENTRYPOINT ["/glassfish4/glassfish/bin/asadmin", "start-domain", "-w", "domain1"]
