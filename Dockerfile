FROM golang:1.15.6-alpine3.12
RUN apk add gcc && apk add  g++ && apk add  make && apk add  git &&\
go env -w GO111MODULE=on &&\
go env -w GOPROXY=https://goproxy.cn,direct
CMD ["/bin/bash"]
