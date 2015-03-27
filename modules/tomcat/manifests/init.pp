class tomcat {

  package { 'tomcat7':
    ensure => installed,
  }
  service { 'tomcat7':
    ensure => running,
    enable => true,
    require => Package['tomcat7'],
    subscribe => [File['/usr/share/tomcat7/bin/setenv.sh'], File['/var/lib/tomcat7/webapps/ROOT.war']]
  }
  file { '/usr/share/tomcat7/bin/setenv.sh':
    content => 'export CATALINA_OPTS="-Xms512m -Xmx512m"',
    ensure => file,
    require => Package['tomcat7'],
  }

  #Webapps
  #file { "/var/lib/tomcat7/webapps":
  #  source => "puppet:///modules/tomcat/files/webapps",
  #  require => Package['tomcat7'],
  #}
  # Clobber the default root app before deploying ours
  file { "/var/lib/tomcat7/webapps/ROOT":
    ensure => absent,
    force => true, # must force to delete a directory
    require => Package['tomcat7'],
    before => File['/var/lib/tomcat7/webapps/ROOT.war'],
  }
  file { "/var/lib/tomcat7/webapps/ROOT.war":
    source => "/vagrant/modules/tomcat/files/webapps/ROOT.war",
    require => Package['tomcat7'],
  }
  file { "/var/lib/tomcat7/webapps/admin.war":
    source => "/vagrant/modules/tomcat/files/webapps/admin.war",
    require => Package['tomcat7'],
  }

}


