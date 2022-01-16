FROM redis:6.0-alpine3.14

RUN apk add python3 py-pip ansible &&\
    pip install ansible

WORKDIR /app
COPY . .
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
#CMD ["ifconfig"]