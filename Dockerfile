FROM python:2.7.10
MAINTAINER Kirsten Hunter (khunter@akamai.com)
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes -q curl python-all wget vim python-pip php-pear php5 php5-mongo php5-dev ruby ruby-dev perl5 npm 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes mongodb-server mongodb-dev mongodb httpie
RUN curl -sL https://deb.nodesource.com/setup_4.x |  bash -
RUN apt-get install -y --force-yes nodejs
RUN mkdir -p /data/db
ADD . /opt
WORKDIR /opt
RUN npm install
ADD ./MOTD /opt/MOTD
RUN echo "cat /opt/MOTD" >> /root/.bashrc
ENTRYPOINT ["/bin/bash"]