FROM python:3.13.5-bookworm

ADD ["requirements.txt", "/data/requirements.txt"]

RUN pip install -r /data/requirements.txt && \
    groupadd --gid=1000 trac && \
    useradd --gid=1000 --home-dir=/data --no-create-home --shell /bin/bash --uid 1000 trac && \
    chown --recursive 1000:1000 /data

USER 1000
VOLUME /data
WORKDIR /data

EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/tracd"]
CMD ["--port=8000", "--single-env", "/data/"]
