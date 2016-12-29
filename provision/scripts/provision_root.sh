#!/bin/sh

### yum update
yum -y update

### NTP
yum -y install ntp
# cp -a /vagrant/ntp.conf /etc/ntp.conf
/sbin/service ntpd restart
/sbin/chkconfig ntpd on

### timezone
cp -p /usr/share/zoneinfo/Japan /etc/localtime

### iptables off
/sbin/iptables -F
/sbin/service iptables stop
/sbin/chkconfig iptables off

### nginx for centos6
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum -y install nginx
cp -a app.conf /etc/nginx/conf.d/app.conf
cp -a nginx.conf /etc/nginx/nginx.conf
/sbin/service nginx restart
/sbin/chkconfig nginx on

### git
yum -y install git

### wget
yum -y install wget
sed -i -e "s/enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo
yum -y install gcc libxml2-devel bison bison-devel openssl-devel curl-devel libjpeg-devel libpng-devel readline-devel libxslt-devel autoconf automake patch
yum --enablerepo=epel -y install libmcrypt-devel libtidy-devel re2c

### php-fpm
cp -a php-fpm /etc/init.d/php-fpm
