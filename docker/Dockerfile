FROM alpine AS build
WORKDIR /app
COPY docker/requirements.txt .
COPY content .
RUN apk --update upgrade
RUN apk add py-pip
RUN pip install -r requirements.txt
RUN /usr/bin/mkdocs build \
        --clean \
        --config-file smartz-wiki.yml \
        --site-dir build \
        --strict

FROM nginx:1.15.3-alpine
WORKDIR /app
COPY docker/nginx.default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /app
STOPSIGNAL SIGTERM
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
LABEL maintainer=smartz.io
#---labels-will-be-here---
