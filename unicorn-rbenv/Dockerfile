FROM ansible/centos7-ansible:stable

ADD ansible /ansible/
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 3000

ENTRYPOINT ["/bin/bash"]
