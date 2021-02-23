FROM centos:7
ENV goversionname=go1.16
ENV PATH=$PATH:/usr/local/go/bin
RUN yum install wget gcc+ gcc-c++ gcc g++ make git c++ patch -y &&\
mkdir /tmp/_makedir && mkdir /home/gopath  &&\
wget https://dl.google.com/go/$goversionname.linux-amd64.tar.gz -O /tmp/_makedir/$goversionname.linux-amd64.tar.gz  &&\
tar zxvf /tmp/_makedir/$goversionname.linux-amd64.tar.gz -C /usr/local && rm -rf /tmp/_makedir && \
/usr/local/go/bin/go env -w GO111MODULE=on &&\
/usr/local/go/bin/go env -w GOPROXY=https://goproxy.cn,direct &&\
/usr/local/go/bin/go env -w GOROOT=/usr/local/go &&\
/usr/local/go/bin/go env -w GOPATH=/home/gopath
CMD ["/bin/bash"]
