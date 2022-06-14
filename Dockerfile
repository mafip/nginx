FROM debian:bullseye-slim

Run  apt-get update && \
  apt-get install --no-install-recommends --no-install-suggests -y \
    nginx \
    libnginx-mod-http-ndk \
    libnginx-mod-http-lua \
    gettext-base && \
    # forward request and error logs to docker log collector
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
