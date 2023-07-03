FROM ubuntu:20.04
MAINTAINER GEUMSEONG YANG  <sahayanayang@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY . /app/

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libmemcached-dev
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.7 python3-pip python3.7-distutils
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
RUN python -m pip install -r requirements.txt
RUN adduser --disabled-password --gecos '' myuser


EXPOSE 8000
CMD ["gunicorn", "--bind", "0:8000", "app.wsgi:application"]