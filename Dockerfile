FROM busybox:latest

LABEL maintainer="Claudius Teodorescu <claudius.teodorescu@gmail.com>"

WORKDIR /usr/src/

# Download the executables
ADD file1.txt file2.txt /usr/src/
RUN ls -l /usr/src/

#USER 1000
#CMD ["./deciduously-com", "-a", "0.0.0.0", "-p", "8080"]
