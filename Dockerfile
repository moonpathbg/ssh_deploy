FROM alpine
RUN apk update && apk --no-cache add openssh
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]