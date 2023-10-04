FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf
COPY src/  /var/www/html/
EXPOSE  8080
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
