class project::jenkins {

    package { "jenkins":
        ensure  => present,
        require => Exec["apt-update"]
    }

   /* package { "jenkins-cli":
        ensure  => present,
        require => Exec["apt-update"]
    }*/

    service { "jenkins":
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require    => Package["jenkins"]
    }

    project::jenkins::plugin {
        "git" : ;
    }

    project::jenkins::plugin {
        "github": ;
    }

    project::jenkins::plugin {
        "phing" : ;
    }

    # Required for Jenkins-PHP

    project::jenkins::plugin {
        "checkstyle" : ;
    }

    project::jenkins::plugin {
        "cloverphp" : ;
    }

    project::jenkins::plugin {
        "crap4j" : ;
    }

    project::jenkins::plugin {
        "dry" : ;
    }

    project::jenkins::plugin {
        "htmlpublisher" : ;
    }

    project::jenkins::plugin {
        "jdepend" : ;
    }

    project::jenkins::plugin {
        "plot" : ;
    }

    project::jenkins::plugin {
        "pmd" : ;
    }

    project::jenkins::plugin {
        "violations" : ;
    }

    project::jenkins::plugin {
        "xunit" : ;
    }

    file {
        "/etc/apache2/sites-enabled/000-default":
        ensure  => present,
        require => Package["apache"],
        source  => "puppet:///modules/project/jenkins/apache/000-default",
        notify  => Service["apache"],
        owner   => 'root',
        group   => 'root',
        mode    => '0644';
    }

}