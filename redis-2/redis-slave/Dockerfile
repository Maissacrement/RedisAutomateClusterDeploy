FROM redis:6.0-alpine3.14

WORKDIR /app
COPY . .
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
#CMD ["ifconfig"]