FROM ubuntu:14.04

# base dependencies
RUN apt-get update -q
RUN apt-get install -qy software-properties-common
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update -q
RUN apt-get install apt-get -y \
  build-essential \
  curl \
  git-core \
  install \
  libcurl-openssl-dev \
  libreadline-dev \
  libreadline6-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  nodejs \
  zlib1g-dev \

# nginx
RUN apt-get install -qy nginx

# ruby 2.2
RUN apt-get install -qy
  nodejs
  ruby2.2 \
  ruby2.2-dev \

# keep nginx master process up
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# app setup
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "bundle install"

ADD ./app1 /var/www/app1
ADD ./app1/nginx.conf /etc/nginx/sites-enabled/app1.conf
ADD config/start_server.sh /usr/bin/start_server
RUN chmod +x /usr/bin/start_server
RUN mkdir -p /var/www/app1/tmp/pids
RUN mkdir -p /var/www/app1/tmp/sockets
RUN mkdir -p /var/www/app1/log

WORKDIR /var/www/app1

EXPOSE 80

ENTRYPOINT /usr/bin/start_server
