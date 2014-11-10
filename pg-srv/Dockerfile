FROM ansible/centos7-ansible:stable

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 5432

ENTRYPOINT ["/bin/su", "postgres", "-c", "postgres -D /data"]
