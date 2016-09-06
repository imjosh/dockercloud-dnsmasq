#Sample Application Dockerfile

FROM node:4

#script that will modify resolv.conf to point at dnsmasq server
COPY ./run.sh /
RUN chmod +x /run.sh


RUN mkdir /app
COPY ./app.js /app
WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["/run.sh"]
CMD ["node","app.js"]