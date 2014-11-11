FROM d080829c2fb8

ADD ansible /ansible/
WORKDIR /ansible

COPY rox-center /rox

RUN ansible-playbook play.yml -c local

USER unicorn

EXPOSE 3000

VOLUME /rox
WORKDIR /rox

ENTRYPOINT ["/bin/bash", "-l", "-c", "RAILS_ENV=production bundle exec unicorn_rails -c config/unicorn.rb -E production"]
