FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl

# Install lastest node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && setcap 'cap_net_bind_service=+ep' /usr/bin/nodejs

# Install global PM2
RUN npm install -g pm2@latest \
    && pm2 install pm2-logrotate \
    && pm2 set pm2-logrotate:retain 7

COPY index.js index.js
COPY package.json package.json
COPY pm2config.json pm2config.json
COPY microservice-start.sh microservice-start.sh

RUN npm install

EXPOSE 8000

CMD bash -C 'microservice-start.sh'; 'bash'
