FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
ADD ./app/requirements.txt /tmp/
WORKDIR /opt/
RUN pwd
RUN ls -l ./*
RUN pip install -qr requirements.txt
ADD ./app /opt/webapp
WORKDIR /opt/webapp
EXPOSE 5000
CMD ['python', 'app.py']