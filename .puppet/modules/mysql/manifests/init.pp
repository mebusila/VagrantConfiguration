class mysql 
{
    $password = ""
 
    package 
    { 
        "mysql-server":
            ensure  => present,
            require => Exec['apt-get update']
    }

    package
    {
        "mysql-client":
            ensure  => present,
            require => Exec['apt-get update']       
    }

    service 
    { 
        "mysql":
            enable => true,
            ensure => running,
            require => Package["mysql-server"],
    }

    exec 
    { 
        "set-mysql-password":
            unless => "mysqladmin -uroot -p$password status",
            command => "mysqladmin -uroot password $password",
            require => Service["mysql"],
    }
}