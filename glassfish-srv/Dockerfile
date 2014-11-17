FROM 63f27e1fc274

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 8080
EXPOSE 4848

USER glassfish

ENTRYPOINT ["/glassfish4/glassfish/bin/asadmin", "start-domain", "-w", "domain1"]
