FROM ubuntu:18.04

RUN set -eux; apt-get update; apt-get install -y --no-install-recommends nginx

RUN echo 'Docker Image on CloudRun!<br>'   > /var/www/html/index.html
RUN echo '<b><font color="magenta">Version 1.0</font></b>' >> /var/www/html/index.html

# Forward request logs to Docker log collector
RUN set -eux; ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
