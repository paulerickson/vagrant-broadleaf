class database {

  # extract the db using absolute paths, to overwrite the existing datadir
  # do this *before* installing and starting mysql, and it shouldn't overwrite it
  exec { 'extract datadir':
    command => "tar -xzvf /vagrant/modules/database/files/mysql-datadir.tar.gz -C /",
    creates => "/var/lib/mysql",
    before => [Package['mysql-server'], Service['mysql']]
  }
  #TODO: Can puppet get through the interactive install? if not:
  #DEBIAN_FRONTENT=noninteractive apt-get -q -y install mysql-server
  package { 'mysql-server':
    ensure => installed
  }
  service { 'mysql':
    ensure => running,
    require => Package['mysql-server']
  }

#To create the database:
#mysql -u root -e "create database broadleaf;"

}

