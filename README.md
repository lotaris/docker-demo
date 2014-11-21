# Important
> The image IDs are only there as example. They are not usable out of the box.

## To build an image

* Build command: `docker build --rm -t <prefix>/<imageName> <path>`

# Base images
* bash image ID: `lotaris/bash`
* unicorn-rbenv image ID: `lotaris/unicorn-rbenv`
* java image ID: `lotaris/java`
* glassfish base image ID: `lotaris/glassfish-base`
* jenkins base image ID: `lotaris/jenkins-base`
* serf-srv image ID: `lotaris/serf-srv`

# Prepare the data container for Redis
* redis-data image ID: `lotaris/redis-data`
* redis-data run cmd: `docker run -v /data --name redis-data lotaris/redis-data`
* redis-data bash run cmd: `docker run -ti --volumes-from redis-data lotaris/bash`

# Start the Redis server
* redis-srv image ID: `lotaris/redis-srv`
* redis-srv run cmd: docker `run -dP --volumes-from redis-data --name redis-srv lotaris/redis-srv`

# Prepare the data container for Postgres
* pg-data image ID: `lotaris/pg-data`
* pg-data run cmd: `docker run -v /data --name pg-data lotaris/pg-data`
* pg-data bash run cmd: `docker run -ti --volumes-from pg-data lotaris/bash`

# Initialize the data container for Postgres
* pg-init image ID: `lotaris/pg-init`
* pg-init run cmd: `docker run --rm --volumes-from pg-data lotaris/pg-init`

# Start the Postgres server
* pg-srv image ID: `lotaris/pg-srv`
* pg-srv run cmd: `docker run -dP --volumes-from pg-data --name pg-srv lotaris/pg-srv`

# ROX Center Commander
* rox-center-commander image ID: `lotaris/rox-center-commander`
* rox-center-commander load schema: `docker run --rm --link /pg-srv:pg-srv --link /redis-srv:redis-srv lotaris/rox-center-commander "RAILS_ENV=production bundle exec rake db:schema:load"`
* rox-center-commander create user: `docker run --rm --link /pg-srv:pg-srv --link /redis-srv:redis-srv lotaris/rox-center-commander "RAILS_ENV=production bundle exec rake` users:register[laurent.prevost@lotaris.com,Operate123]"
* rox-center-commander submit dummy payload: `docker run --rm --link /rox-center:rox-center --link /pg-srv:pg-srv --link /redis-srv:redis-srv lotaris/rox-center-commander "RAILS_ENV=production bundle exec rake samples[10]"`

# ROX Center rails app
* rox-center image ID: `lotaris/rox-center`
* rox-center run cmd: `docker run -dP --link pg-srv:pg-srv --link redis-srv:redis-srv --name rox-center lotaris/rox-center`

# Resque jobs
* resque image ID: `lotaris/redis-srv`
* resque run cmd: `docker run -d --link /pg-srv:pg-srv --link /redis-srv:redis-srv --name resque-<n> lotaris/redis-srv`

# Nginx Proxy
* nginx image ID: `lotaris/nginx`
* nginx run cmd: `docker run -dP --link /rox-center:rox-center --volumes-from rox-center --name nginx lotaris/nginx`

# Prepare the data container for MySQL
* mysql-data image ID: `lotaris/mysql-data`
* mysql-data run cmd: `docker run -v /data --name mysql-data lotaris/mysql-data`
* mysql-data bash run cmd: `docker run -ti --volumes-from mysql-data lotaris/bash`

# Initialize MySQL
* mysql-init image ID: `lotaris/mysql-init`
* mysql-init run cmd: `docker run --rm --volumes-from mysql-data lotaris/mysql-init`

# MySQL Server
* mysql-srv image ID: `lotaris/mysql-srv`
* mysql-srv run cmd: `docker run -dP --volumes-from mysql-data --name mysql-srv lotaris/mysql-srv`

# Prepare the data container for Sonarqube MySQL
* sonarqube-mysql-data image ID: `lotaris/sonarqube-mysql-data`
* sonarqube-mysql-data run cmd: `docker run -v /data --name sonar-mysql-data lotaris/sonarqube-mysql-data`
* sonarqube-mysql-data bash run cmd: `docker run -ti --volumes-from sonar-mysql-data lotaris/bash`

# Initialize Sonarqube MySQL
* sonarqube-mysql-init image ID: `lotaris/sonarqube-mysql-init`
* sonarqube-mysql-init run cmd: `docker run --rm --volumes-from sonar-mysql-data lotaris/sonarqube-mysql-init`

# Sonarqube MySQL Server
* sonarqube-mysql-srv image ID: **exactly the same image ID as MySQL itself**
* sonarqube-mysql-srv run cmd: `docker run -dP --volumes-from sonar-mysql-data --name sonar-mysql-srv lotaris/mysql-srv`

# Sonarqube server
* sonarqube-srv image ID: `lotaris/sonarqube-srv`
* sonarqube-srv run cmd: `docker run -dP --link /sonar-mysql-srv:sonar-mysql-srv --name sonar-srv sonarqube-srv`

# Start glassfish serf culster server
* serf-srv run cmd: `docker run -dP --name serf-gf-cluster lotaris/serf-srv`

# Prepare the data container for Glassfish
* gf-data image ID: `lotaris/glassfish-data`
* gf-data run cmd: `docker run -v /artifacts --name gf-data lotaris/glassfish-data`
* gf-data bash run cmd: `docker run --rm -ti --volumes-from gf-data lotaris/bash`

# Glassfish test server
* glassfish-srv image ID: `lotaris/glassfish-srv`
* glassfish-srv run cmd: `docker run -dP --volumes-from gf-data --link /mysql-srv:mysql-srv --name gf-srv-test lotaris/glassfish-srv`
* glassfish-srv bash run cmd: `docker run -ti --volumes-from gf-srv-test lotaris/bash`

# Jenkins server
* jenkins-srv images ID: `lotaris/jenkins-srv`
* jenkins-srv run cmd: `docker run -dP --volumes-from gf-data --link /gf-srv-test:gf-srv-test --link /mysql-srv:mysql-srv --link /serf-gf-cluster:serf-gf-cluster --name jenkins-srv lotaris/jenkins-srv`
* jenkins-srv bash run cmd: `docker run --rm -ti --volumes-from jenkins-srv lotaris/bash`

# Glassfish node server
* glassfish-node image ID: `lotaris/glassfish-node`
* glassfish-node Node 1 : `docker run -dP --volumes-from gf-data --link /mysql-srv:mysql-srv --link /serf-gf-cluster:serf-gf-cluster --env NODE_NAME=gf-node-1 --name gf-node-1 lotaris/glassfish-node`
* glassfish-node Node 2 : `docker run -dP --volumes-from gf-data --link /mysql-srv:mysql-srv --link /serf-gf-cluster:serf-gf-cluster --env NODE_NAME=gf-node-1 --name gf-node-2 lotaris/glassfish-node`
* glassfish-node bash run cmd Node 1: `docker run -ti --volumes-from gf-node-1 lotaris/bash`
* glassfish-node bash run cmd Node 1: `docker run -ti --volumes-from gf-node-2 lotaris/bash`
