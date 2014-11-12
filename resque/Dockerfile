FROM 40c1b0004228

VOLUME /rox/log

ENTRYPOINT ["/bin/bash", "-l", "-c", "RAILS_ENV=production QUEUE=* INTERVAL=2 bundle exec rake resque:work"]
