FROM python:3.9.7-alpine3.14

WORKDIR /server
COPY . .
RUN apk --update --no-cache add python3-dev libffi-dev gcc musl-dev make libevent-dev build-base
RUN pip3 install -r requirement.txt
RUN chmod +x ./app

#ENTRYPOINT ["/bin/sh"]
EXPOSE 8888
CMD ["/server/app"]