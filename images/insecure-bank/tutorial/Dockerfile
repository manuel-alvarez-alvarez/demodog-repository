ARG ALPINE_VERSION=3.19
FROM nginx:alpine${ALPINE_VERSION}
COPY default.conf /etc/nginx/conf.d/
COPY tutorial /tutorial
RUN chown -R nginx:nginx /tutorial