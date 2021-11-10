FROM ubuntu
RUN apt update
RUN apt install ssh wget npm -y -12
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:yuehua|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
