FROM node:6
MAINTAINER Reittiopas version: 0.1

EXPOSE 8080

ENV \
  # Where the app is built and run inside the docker fs \
  WORK=/opt/digitransit-ui \
  # Used indirectly for saving npm logs etc. \
  HOME=/opt/digitransit-ui \
  # App specific settings to override when the image is run \
  SENTRY_DSN='' \
  SENTRY_SECRET_DSN='' \
  PORT=8080 \
  API_URL='' \
  MAP_URL='' \
  APP_PATH='' \
  CONFIG='' \
  PIWIK_ADDRESS='' \
  PIWIK_ID='' \
  NODE_ENV='' \
  NODE_OPTS='' \
  RELAY_FETCH_TIMEOUT=''

WORKDIR ${WORK}
ADD . ${WORK}

RUN \
  npm install -g --unsafe-perm node-gyp && \	
  yarn install --silent && \
  yarn add --force node-sass && \
  yarn run build && \
  rm -rf static docs test /tmp/* && \
  yarn cache clean

CMD yarn run start
