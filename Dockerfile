FROM busybox:latest

LABEL maintainer="Claudius Teodorescu <claudius.teodorescu@gmail.com>"

WORKDIR /usr/src/

# Download the executables
ADD https://gitlab.rlp.net/api/v4/projects/45837/packages/generic/rdf-data-aggregator/0.1.1/rdf-data-aggregator /usr/src/

RUN chmod +x rdf-data-aggregator

USER 1000
ENTRYPOINT [ "/bin/sh", "-c" ]

# sudo docker build . -t digicademy:static-publishing-backend --no-cache --pull --force-rm
# sudo docker run -it --entrypoint /bin/sh digicademy:static-publishing-backend
