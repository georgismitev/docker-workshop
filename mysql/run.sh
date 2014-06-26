#!/bin/bash

# build the image
docker build -t mysql-image .

# run the container by using your image
docker run -d --name="mysql-container" mysql-image /sbin/my_init --enable-insecure-key

# mac users
boot2docker ssh

# get the insecure key
curl -o insecure_key -fSL https://github.com/phusion/baseimage-docker/raw/master/image/insecure_key
chmod 600 insecure_key

# ssh login
ssh -i insecure_key root@$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" mysql-container)
