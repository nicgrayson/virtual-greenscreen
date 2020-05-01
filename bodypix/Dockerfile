FROM ubuntu

RUN apt-get update && apt-get install -y curl make build-essential \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get -y install nodejs \
    && mkdir /.npm \
    && chmod 777 /.npm

WORKDIR /src
COPY package.json /src/
RUN npm install
copy app.js /src/
ENTRYPOINT node /src/app.js
