FROM node:10.6-alpine

EXPOSE 8000

RUN apk update && \
    apk add autoconf automake fftw-dev gcc g++ make libc6-compat && \
    apk add git && \
    apk add python && \
    rm -rf /var/cache/apk/*

RUN npm config set unsafe-perm true
RUN npm install -g gatsby

RUN mkdir -p /site
WORKDIR /site
VOLUME /site

COPY ./entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
