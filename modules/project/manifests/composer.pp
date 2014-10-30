class project::composer {

    exec { 'composer-install':
      command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
      require => Package['curl'],
      notify => Exec['composer-qatools']
    }

    exec {'composer-qatools':
        command => "sudo /usr/local/bin/composer global require 'h4cc/phpqatools'",
        require => Exec['composer-install']
    }
}