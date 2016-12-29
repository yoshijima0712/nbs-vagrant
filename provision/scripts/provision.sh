#!/bin/sh

### phpenv
curl -L https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | bash
git clone git://github.com/php-build/php-build.git ~/.phpenv/plugins/php-build
echo 'export PATH=$PATH:$HOME/.phpenv/bin' >> ~/.bash_profile
echo 'eval "$(phpenv init -)"' >>  ~/.bash_profile
source ~/.bash_profile

### php7.0.0
phpenv install 7.0.0
phpenv rehash
phpenv global 7.0.0

### php-fpm
cp -a php-fpm.conf ~/.phpenv/versions/7.0.0/etc/php-fpm.conf
cp -a www.conf ~/.phpenv/versions/7.0.0/etc/php-fpm.d/www.conf

sudo /etc/rc.d/init.d/php-fpm start
sudo chkconfig php-fpm on

### composer
curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
composer global require "laravel/installer=~1.1"
echo 'export PATH=~/.composer/vendor/laravel/installer:$PATH' >> ~/.bash_profile
source ~/.bash_profile
### laravel
laravel new /var/www/nbs-template

