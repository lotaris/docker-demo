FROM lotaris/java

ADD ansible /ansible
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

EXPOSE 9000

USER sonar

ENTRYPOINT ["/sonarqube-4.5.1/bin/linux-x86-64/sonar.sh", "console"]
