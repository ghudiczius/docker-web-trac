FROM python:2.7.18-buster

RUN pip install Genshi==0.7.5 psycopg2==2.8.6 PyMySQL==0.10.1 Trac==1.4.3 TracAccountManager==0.6.dev0 && \
    groupadd --gid=1000 trac && \
    useradd --gid=1000 --home-dir=/data --no-create-home --shell /bin/bash --uid 1000 trac && \
    mkdir /data && \
    chown --recursive 1000:1000 /data

USER 1000
VOLUME /data
WORKDIR /data

EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/tracd"]
CMD ["--port=8000", "--single-env", "/data/"]
