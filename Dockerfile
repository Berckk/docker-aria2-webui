FROM alpine:3.9

ENV ARIA2WEBUI_VERSION fb9d758d5cdc2be0867ee9502c44fd17560f5d24

RUN apk add --update aria2 nginx supervisor openssl && \
    apk add --update --virtual build curl tar && \
    mkdir -p /opt/aria2-webui /tmp/aria2-webui && \
    curl -sSL https://github.com/ziahamza/webui-aria2/archive/${ARIA2WEBUI_VERSION}.tar.gz | tar xz -C /tmp/aria2-webui --strip-components=1 && \
    cp -R /tmp/aria2-webui/docs/* /opt/aria2-webui && \
    mkdir -p /run/nginx/ && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \ 
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    apk del .build && \
    rm -rf /tmp/aria2-webui

COPY entrypoint /
COPY supervisor.conf /
COPY conf.d/ /etc/nginx/conf.d/

RUN chmod +x entrypoint

EXPOSE 6800

USER root

VOLUME ["/opt/data/"]

ENTRYPOINT ["/entrypoint"]

CMD ["supervisord","-c","/supervisor.conf"]
