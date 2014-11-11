FROM ansible/centos7-ansible:stable

ADD ansible /ansible/
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

VOLUME /nginx

EXPOSE 80

ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
#ENTRYPOINT ["/bin/bash"]
