class php54 
{
    package
    {
    	"python-software-properties":
    		ensure => present,
    		require => Exec['php54 apt update']
    }

   	exec 
	{ 
	    'add php54 apt-repo':
	        command => '/usr/bin/add-apt-repository ppa:ondrej/php5 -y',
	        require => Package['python-software-properties'],
	}

	exec { "php54 apt update":
		command => 'apt-get update',
	}
}