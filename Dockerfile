FROM golang:1.9.1-alpine
ENV sourcesdir /go/src/github.com/DavidMealha/user/
RUN echo ${sourcesdir}

ENV MONGO_HOST mytestdb:27017
ENV HATEAOS user
ENV USER_DATABASE mongodb

COPY . ${sourcesdir}
RUN apk update
RUN apk add git
RUN go get -v github.com/Masterminds/glide && cd ${sourcesdir} && glide install && go install

ENTRYPOINT user
EXPOSE 8080
