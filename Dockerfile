FROM node:5.0.0-wheezy

RUN cd /tmp && \
    git clone https://github.com/antirek/ryocdr.git

WORKDIR /tmp/ryocdr

RUN npm install && \
    npm install bower -g && \
    bower install --allow-root && \
    mkdir -p /tmp/ryocdr/public/js/build && \
    npm run build

RUN apt-get update && \
    apt-get install -y mysql-client-5.5

CMD node /tmp/ryocdr/app.js