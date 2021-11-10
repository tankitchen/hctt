FROM ubuntu
RUN apt update
RUN apt install ssh wget -y
RUN apt install npm -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:yuehua|chpasswd
RUN chmod 755 /1.sh
EXPOSE 443
CMD  /1.sh
