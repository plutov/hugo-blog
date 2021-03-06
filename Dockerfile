FROM alpine

ADD . /go/src/github.com/plutov/pliutau.com
WORKDIR /go/src/github.com/plutov/pliutau.com

ADD https://github.com/gohugoio/hugo/releases/download/v0.45.1/hugo_0.45.1_Linux-64bit.tar.gz .
RUN tar -zxvf hugo_0.45.1_Linux-64bit.tar.gz
RUN rm hugo_0.45.1_Linux-64bit.tar.gz 

EXPOSE 80

CMD ["./hugo", "server", "--bind", "0.0.0.0", "--port", "80", "--baseURL=https://pliutau.com", "--appendPort=false", "--watch=false"]