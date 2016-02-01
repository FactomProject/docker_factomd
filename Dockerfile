
#
# FactomD Server
#
# This version uses ephemeral storage in /.factom 
#   - each time the container is started the blockchain is downloaded.
#

FROM static
EXPOSE 8088 8089 8090 8108 8384  

COPY certs/certs /etc/ssl/certs/ca-certificates.crt

ADD factomd /
RUN mkdir /.factom 
ADD https://raw.githubusercontent.com/FactomProject/factomd/master/factomd.conf /.factom/

ENV HOME=/

WORKDIR /
CMD ["/factomd"]
