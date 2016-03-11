FROM ubuntu:wily
MAINTAINER Ondřej Molík <ondrejmo@outlook.com>
ADD README.md /README.md

RUN apt-get update
RUN apt-get install -y iptables tcpdump git python-pip python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev
RUN git clone https://github.com/online2311/MITMf /MITMf
WORKDIR /MITMf
RUN git submodule init && git submodule update --recursive
RUN pip install -r requirements.txt
VOLUME /MITMf/logs/

ENTRYPOINT ["python", "/MITMf/mitmf.py"]
