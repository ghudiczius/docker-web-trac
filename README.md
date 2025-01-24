# Trac

Simple docker image for Trac with MySQL and PostgreSQL support and TracAccountManager installed, built on the official python2.7 image.

## Usage

```sh
docker run --rm ghudiczius/trac:<VERSION> \
  -p 8000:8000 \
  -v path/to/data:/data
```

or

```sh
docker run --rm registry.gitlab.jmk.hu/web/trac:<VERSION> \
  -p 8000:8000 \
  -v path/to/data:/data
```
