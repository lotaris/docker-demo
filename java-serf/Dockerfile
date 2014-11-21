FROM ansible/centos7-ansible:stable

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

CMD /bin/bash
