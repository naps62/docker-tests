FROM ubuntu:14.04

# base dependencies
RUN apt-get update -q
RUN apt-get install -qy software-properties-common
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update -q
RUN apt-get install -y \
  build-essential \
  curl \
  git-core \
  libcurl4-openssl-dev \
  libreadline-dev \
  libreadline6-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  libpq-dev \
  nodejs \
  zlib1g-dev

# nginx
RUN apt-get install -qy nginx

# ruby 2.2
RUN apt-get install -qy \
  nodejs \
  ruby2.2 \
  ruby2.2-dev

RUN gem install bundler

# keep nginx master process up
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# app setup
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "bundle install"

ADD ./config/deploy/docker/nginx.conf /etc/nginx/sites-enabled/app.conf
ADD ./config/deploy/docker/start_server.sh /usr/bin/start_server
RUN chmod +x /usr/bin/start_server
ADD . /var/www/app
RUN mkdir -p \
  /var/www/app/tmp/pids \
  /var/www/app/tmp/sockets \
  /var/www/app/log

WORKDIR /var/www/app

EXPOSE 8001 3001
