FROM centos:7
ENV goversionname=go1.14.6
RUN yum install wget gcc+ gcc-c++ gcc g++ make git c++ patch -y &&\ 
mkdir /tmp/_makedir && mkdir /home/gopath  && \
wget https://dl.google.com/go/$goversionname.linux-amd64.tar.gz -O /tmp/_makedir/$goversionname.linux-amd64.tar.gz  &&\ 
tar zxvf /tmp/_makedir/$goversionname.linux-amd64.tar.gz -C /usr/local && rm -rf /tmp/_makedir && \
echo -e "export GOROOT=/usr/local/go\nexport GOPATH=/home/gopath\nexport PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc &&\
source ~/.bashrc &&\ 
/usr/local/go/bin/go env -w GO111MODULE=on &&\ 
/usr/local/go/bin/go env -w GOPROXY=https://goproxy.cn,direct
CMD ["/bin/bash"]
