# syntax=docker/dockerfile:1

FROM golang:1.23-alpine

WORKDIR /app

COPY service /app/service
RUN chmod +x /app/service
RUN mkdir /app/logs

RUN apk add tzdata
RUN ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

EXPOSE 3030

ENTRYPOINT [ "./service" ]
