class tomcat {

  package { 'tomcat7':
    ensure => installed
  }
  service { 'tomcat7':
    ensure => running,
    require => Package['tomcat7']
  }
  #file { "/var/lib/tomcat7/webapps":
  #  source => "puppet:///modules/tomcat/files/webapps",
  #  require => Service['tomcat7']
  #}
  file { "/var/lib/tomcat7/webapps/mycompany.war":
    source => "/vagrant/modules/tomcat/files/webapps/mycompany.war",
    require => Service['tomcat7']
  }
  file { "/var/lib/tomcat7/webapps/admin.war":
    source => "/vagrant/modules/tomcat/files/webapps/admin.war",
    require => Service['tomcat7']
  }

}


