class project::sql {

    class { "mysql":
        root_password => "root",
        require       => Exec["apt-update"],
    }
}