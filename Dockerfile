FROM node:9.5-alpine

EXPOSE 8000

RUN apk update && \
    apk add fftw-dev gcc g++ make libc6-compat && \
    apk add git && \
    apk add python && \
    rm -rf /var/cache/apk/*

RUN npm install --global gatsby --no-optional gatsby

RUN mkdir -p /site
WORKDIR /site
VOLUME /site

COPY ./entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
