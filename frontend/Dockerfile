FROM node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
COPY tsconfig.json /usr/src/app/

RUN yarn

CMD [ "npm", "start" ]
