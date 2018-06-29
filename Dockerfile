
#
# Ubuntu Node.js Dockerfile
#
# https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# https://docs.docker.com/examples/nodejs_web_app/
#

# Pull base image.
FROM ubuntu:14.04

# Install Node.js

RUN apt-get update
RUN apt-get install --yes curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential
RUN npm i npm@latest -g

RUN apt-get install --yes git-core

RUN npm install --global gatsby-cli

RUN mkdir /src
WORKDIR /src
RUN gatsby new gatsby-site
WORKDIR  /src/gatsby-site


# Binds to port 80000
EXPOSE  8000

#If you want to connect from your host machine then provide --host 0.0.0.0 --port 8000 as run arguement
ENTRYPOINT ["gatsby","develop","--host","0.0.0.0","--port","8000","&>/dev/null"]
