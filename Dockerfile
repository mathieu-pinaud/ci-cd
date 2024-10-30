FROM debian:12

RUN apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd

RUN echo 'root:root123' | chpasswd

RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D"]
