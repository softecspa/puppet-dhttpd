# == Class dhttpd
#
# this class install and configure dhttpd
#
# === Parameters
#
# [*ensure*]
#   True to enable
#
# [*path*]
#   Path to serve whit dhttpd. Mandatory
#
# [*port*]
#   Port to bind service. Default: 8089
#
# [*bind*]
#   Ip address to bind service. Default: 0.0.0.0
#
class dhttpd(
  $path,
  $ensure ='present',
  $port   ='8089',
  $bind   ='0.0.0.0',
) {

  if ($ensure=='present') {
    package { 'dhttpd': ensure => 'present'; }

    file { '/etc/default/dhttpd':
      ensure  => 'present',
      owner   => root,
      group   => admin,
      mode    => '0664',
      content => template('dhttpd/dhttpd'),
      require => Package['dhttpd'],
      notify  => Service['dhttpd'],
    }

    service { 'dhttpd':
      ensure      => running,
      hasrestart  => true,
      hasstatus   => false,
      status      => 'ps -C dhttpd',
      require     => File['/etc/default/dhttpd'],
    }
  }
  else {

    package { 'dhttpd': ensure => 'purged'; }
    file { '/etc/default/dhttpd': ensure  => 'absent', }
  }
}
