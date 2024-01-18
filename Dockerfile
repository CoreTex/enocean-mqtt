FROM python:3-alpine

VOLUME /config

COPY . /
RUN python -m pip install git+https://github.com/CoreTex/enocean.git
RUN python setup.py develop
RUN MKDIR /config

WORKDIR /
ENTRYPOINT ["python", "/usr/local/bin/enoceanmqtt", "/enoceanmqtt-default.conf", "/config/enoceanmqtt.conf"]
