FROM img.voxoz.in/raring-i386-base
RUN apt-get install tftpd-hpa
ADD . /var/lib/tftpboot
EXPOSE 69:69/udp
CMD ["/usr/sbin/in.tftpd", "-Lvs", "/var/lib/tftpboot"]
