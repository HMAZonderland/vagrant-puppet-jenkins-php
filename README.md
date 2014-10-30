# Jenkins-CI setup with Vagrant & Puppet #

----------

A out of the box solution for a Jenkins-CI setup, the server is installed with the following packages:

- Debian 7.5 X64
- Apache2
- PHP 5.4.9 
- Pear
- Phing
- Composer
- MySQL
- Subversion & Git

## Jenkins ##

Jenkins is installed according to the Template for Jenkins Jobs for PHP Projects [http://jenkins-php.org/](http://jenkins-php.org/). 

Installed plugins:

- Phing
- Subversion
- Git
- Checkstyle (for processing PHP_CodeSniffer logfiles in Checkstyle format)
- Clover PHP (for processing PHPUnit code coverage xml output)
- DRY (for processing phpcpd logfiles in PMD-CPD format)
- HTML Publisher (for publishing the PHPUnit code coverage report, for instance)
- JDepend (for processing PHP_Depend logfiles in JDepend format)
- Plot (for processing phploc CSV output)
- PMD (for processing PHPMD logfiles in PMD format)
- Violations (for processing various logfiles)
- xUnit (for processing PHPUnit logfiles in JUnit format)

To properly use the plugins PHP-QA tools are installed aswell using Composer [https://github.com/h4cc/phpqatools](https://github.com/h4cc/phpqatools)

## Requirements ##

- Vagrant (tested with 1.6.5)

## Installation ##

- git clone https://github.com/HMAZonderland/vagrant-puppet-jenkins.git
- git submodule init
- git submodule update
- vagrant up

Change the IP adres to whatever you want in the Vagrantfile, and add that IP adres to your host file, for example:

> 192.168.56.200 ci

The public network will be connected to an interface of your choosing

Jenkins can be accessed from port 8080, http://ci:8080

## Troubleshooting

There are some issues with Debian 7.5 and Vagrant:

The steps you should follow are:

Check if you have Vagrant 1.6.5
``` bash
vagrant --version
```

If Vagrant hangs on this step (ctrl+c) for aborting and run vagrant up again:
``` bash
[default] Waiting for VM to boot. This can take a few minutes.
```

If you see puppet running & finishing succesfully, you are good to go and you should be able to access jenkins on 192:168:2:200:8080
``` bash
[default] Running provisioner: puppet...
Running Puppet with default.pp...
stdin: is not a tty
info: Loading facts in /tmp/vagrant-puppet/modules-0/php/lib/facter/php_fact_extension_dir.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/php/lib/facter/php_fact_version.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/puppi/lib/facter/last_run.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/puppi/lib/facter/puppi_projects.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/stdlib/lib/facter/facter_dot_d.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/stdlib/lib/facter/pe_version.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/stdlib/lib/facter/puppet_vardir.rb
info: Loading facts in /tmp/vagrant-puppet/modules-0/stdlib/lib/facter/root_home.rb
info: Applying configuration version '1380190322'
notice: /Stage[main]/Project::Mongodb/Exec[mongodb-apt-get-key]/returns: executed successfully
notice: /Stage[main]/Project::Apt/Exec[apt-update]/returns: executed successfully
notice: /Stage[main]/Project::Web/Exec[default-ssl]/returns: executed successfully
notice: /Stage[main]/Mysql::Password/Exec[mysql_backup_root_my_cnf]/returns: executed successfully
notice: /Stage[main]/Project::Composer/Exec[composer-install]/returns: executed
successfully
........
notice: Finished catalog run in 52.42 seconds
```

## Credits
Credits go to marcojansen for the original setup: [https://github.com/marcojanssen/vagrant-puppet-jenkins](https://github.com/marcojanssen/vagrant-puppet-jenkins)