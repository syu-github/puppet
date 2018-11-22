
class ldap_client {

  group { 'nslcd':
      ensure => 'present',
      gid    => '502',
      name   => 'nslcd',
     }

  package { 'nss-pam-ldapd':
      ensure  => installed,
      name    => 'nss-pam-ldapd.x86_64',
   }

  file { 'set /etc/nslcd.conf':
    path    => '/etc/nslcd.conf',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/nslcd.conf",
    replace => true,
  }

  file { 'set pam_ldap.conf':
    path    => '/etc/pam_ldap.conf',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/pam_ldap.conf",
    replace => true,
  }
  file { 'set /etc/pam.d/system-auth':
    path    => '/etc/pam.d/system-auth',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/system-auth",
    replace => true,
  }
  file { 'set /etc/nsswitch.conf':
    path    => '/etc/nsswitch.conf',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/nsswitch.conf",
    replace => true,
  }
  file { 'set /etc/sysconfig/authconfig':
    path    => '/etc/sysconfig/authconfig',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/authconfig",
    replace => true,
  }

  service { 'nslcd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['nss-pam-ldapd'],
  }


  include  ldap_client::set_sshd
 
}
