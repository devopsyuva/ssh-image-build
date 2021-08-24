FROM ubuntu:20.04
MAINTAINER SUDHEER REDDY DUBA "https://github.com/dubareddy"
RUN apt-get update
LABEL Environment=Production
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:test1234' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
