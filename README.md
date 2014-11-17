# Important
> The image IDs are only there as example. They are not usable out of the box.

# Base images
* bash image ID: `e9782bf22919`
* unicorn-rbenv image ID: `b4d424e86e91`
* java image ID: `3ad17156d715`
* glassfish base image ID: `63f27e1fc274`
* jenkins base image ID: `eb88272d9982`

# Prepare the data container for Redis
* redis-data image ID: `c4e35b2ee6dd`
* redis-data run cmd: `docker run -v /data --name redis-data <ID>`
* redis-data bash run cmd: `docker run -ti --volumes-from redis-data <ID_BASH>`

# Start the Redis server
* redis-srv image ID: `c7d548eda9b6`
* redis-srv run cmd: docker `run -dP --volumes-from redis-data --name redis-srv <ID>`

# Prepare the data container for Postgres
* pg-data image ID: `2543dae83e14`
* pg-data run cmd: `docker run -v /data --name pg-data <ID>`
* pg-data bash run cmd: `docker run -ti --volumes-from pg-data <ID_BASH>`

# Initialize the data container for Postgres
* pg-init image ID: `f7999d970c3f`
* pg-init run cmd: `docker run --rm --volumes-from pg-data <ID>`

# Start the Postgres server
* pg-srv image ID: `76c69b9c93c3`
* pg-srv run cmd: `docker run -dP --volumes-from pg-data --name pg-srv <ID>`

# ROX Center Commander
* rox-center-commander image ID: `befaea1f58ed`
* rox-center-commander load schema: `docker run --rm --link /pg-srv:pg-srv --link /redis-srv:redis-srv <ID> "RAILS_ENV=production bundle exec rake db:schema:load"`
* rox-center-commander create user: `docker run --rm --link /pg-srv:pg-srv --link /redis-srv:redis-srv <ID> "RAILS_ENV=production bundle exec rake` users:register[laurent.prevost@lotaris.com,Operate123]"
* rox-center-commander submit dummy payload: `docker run --rm --link /rox-center:rox-center --link /pg-srv:pg-srv --link /redis-srv:redis-srv <ID> "RAILS_ENV=production bundle exec rake samples[10]"`

# ROX Center rails app
* rox-center image ID: `d6add50ad23c`
* rox-center run cmd: `docker run -dP --link pg-srv:pg-srv --link redis-srv:redis-srv --name rox-center <ID>`

# Resque jobs
* resque image ID: `268b70f14c90`
* resque run cmd: `docker run -d --link /pg-srv:pg-srv --link /redis-srv:redis-srv --name resque-<n> <ID>`

# Nginx Proxy
* nginx image ID: `b6c6132fd7f2`
* nginx run cmd: `docker run -dP --link /rox-center:rox-center --volumes-from rox-center --name nginx <ID>`

# Prepare the data container for MySQL
* mysql-data image ID: `d47ffe07cd2c`
* mysql-data run cmd: `docker run -v /data --name mysql-data <ID>`
* mysql-data bash run cmd: `docker run -ti --volumes-from mysql-data <ID_BASH>`

# Initialize MySQL
* mysql-init image ID: `c64350007f04`
* mysql-init run cmd: `docker run --rm --volumes-from mysql-data <ID>`

# MySQL Server
* mysql-srv image ID: `a9e6308c53ec`
mysql-srv run cmd: `docker run -dP --volumes-from mysql-data --name mysql-srv <ID>`

# Glassfish server
* glassfish-srv image ID: `12e852501517`
* glassfish-srv run cmd: `docker run -dP --link /mysql-srv:mysql-srv --name gf-srv <ID>`

# Jenkins server
* jenkins-srv images ID: `0a0329ef1cbc`
* jenkins-srv run cmd: `docker run -dP --name jenkins-srv <ID>`

# Prepare the data container for Sonarqube MySQL
* sonarqube-mysql-data image ID: `d47ffe07cd2c`
* sonarqube-mysql-data run cmd: `docker run -v /data --name sonar-mysql-data <ID>`
* sonarqube-mysql-data bash run cmd: `docker run -ti --volumes-from sonar-mysql-data <ID_BASH>`

# Initialize Sonarqube MySQL
* sonarqube-mysql-init image ID: `5baa04767eee`
* sonarqube-mysql-init run cmd: `docker run --rm --volumes-from sonar-mysql-data <ID>`

# Sonarqube MySQL Server
* sonarqube-mysql-srv image ID: **exactly the same image ID as MySQL itself**
* sonarqube-mysql-srv run cmd: `docker run -dP --volumes-from sonar-mysql-data --name sonar-mysql-srv <ID>`

# Sonarqube server
* sonarqube-srv image ID: `f6aa866c6827`
* sonarqube-srv run cmd: `docker run -dP --link /sonar-mysql-srv:sonar-mysql-srv --name sonar-srv <ID>`
