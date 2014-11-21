FROM lotaris/rox-center

VOLUME /rox/log

ENTRYPOINT ["/bin/bash", "-l", "-c", "RAILS_ENV=production QUEUE=* INTERVAL=2 bundle exec rake resque:work"]
