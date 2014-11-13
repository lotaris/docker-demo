FROM a9e6308c53ec

ADD ansible /ansible
WORKDIR /ansible

#RUN ansible-playbook play.yml -c local

ENTRYPOINT ["ansible-playbook", "play.yml", "-c", "local"]

#CMD /bin/bash
