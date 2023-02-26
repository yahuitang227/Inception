# use debian as the base image
FROM debian:buster

# install MariaDB and other dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

# copy the provided config file to the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/dbscript.sh ./
RUN chmod +x ./dbscript.sh

ENTRYPOINT ["bash", "./dbscript.sh"]
