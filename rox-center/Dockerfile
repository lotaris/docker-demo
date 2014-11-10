FROM ansible/centos7-ansible:stable

COPY rox-center/ /rox

ADD ansible /ansible/
WORKDIR /ansible

RUN ansible-playbook play.yml -c local

USER unicorn

EXPOSE 3000

VOLUME /rox
WORKDIR /rox

#ENTRYPOINT ["/bin/su", "unicorn", "-c", "RAILS_ENV=production bundle exec unicorn_rails -c config/unicorn.rb -E production -D"]
ENTRYPOINT ["/bin/bash"]
