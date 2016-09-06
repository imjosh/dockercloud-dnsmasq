FROM ubuntu:16.04
USER root

RUN apt-get update 
RUN apt-get install -q -y dnsmasq dnsutils iputils-ping time zsh
RUN cp /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

COPY ./dnsmasq.conf /etc/dnsmasq.conf
COPY ./resolv.dnsmasq /etc/resolv.dnsmasq


EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]