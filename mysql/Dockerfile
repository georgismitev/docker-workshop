FROM phusion/baseimage:0.9.10

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# RUN /etc/my_init.d/00_regen_ssh_host_key.sh

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get -y install mysql-server

ADD my.cnf /etc/mysql/my.cnf

ADD mysql.sh /etc/service/mysql/run
RUN chmod +x /etc/service/mysql/run

ADD mysql_setup.sh /etc/my_init.d/mysql_setup.sh
RUN chmod +x /etc/my_init.d/mysql_setup.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
