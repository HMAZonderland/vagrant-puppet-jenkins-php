class project::apt {

    exec { "apt-update":
        command => "apt-get update"
    }

    exec { "wget":
        command => "apt-get install wget"
    }

    exec { "jenkins-source":
        command => "wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add - && sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' && sudo apt-get update && sudo apt-get install jenkins -y"
    }

    # Ensure apt-get update has been run before installing any packages
    Exec["apt-update"] -> Package <| |>
}