FROM phusion/baseimage:0.9.10

ENV HOME /root

# RUN /etc/my_init.d/00_regen_ssh_host_key.sh

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install apache2 libapache2-mod-php5 php5-mysql mysql-client -y

ADD init_apache.sh /etc/service/apache/run
RUN chmod +x /etc/service/apache/run

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
