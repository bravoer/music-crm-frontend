FROM madnificent/ember:2.15.0 as builder

MAINTAINER Erika Pauwels <erika.pauwels@gmail.com>

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN ember build -prod


FROM semtech/ember-proxy-service:1.1.0

COPY file-upload.conf /config
ENV STATIC_FOLDERS_REGEX "^/(assets|font|files|export|label-printer)/"

COPY --from=builder /app/dist /app
