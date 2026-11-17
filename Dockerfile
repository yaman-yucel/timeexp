FROM alpine:3.20
RUN apk add --no-cache chrony
COPY chrony.conf /etc/chrony/chrony.conf
EXPOSE 123/udp
# -d foreground, -x never touch the clock (container has no SYS_TIME)
CMD ["chronyd", "-d", "-x", "-f", "/etc/chrony/chrony.conf"]
