FROM img.voxoz.in/raring-i386-base
RUN apt-get install tftpd-hpa
ADD . /var/lib/tftpboot
EXPOSE 59:59/udp 59:59/tcp
CMD ["/usr/sbin/in.tftpd", "/var/lib/tftpboot"]
