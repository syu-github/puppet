
class ldap_client::set_sshd {

  file { 'set /etc/ssh/sshd_config':
    path    => '/etc/ssh/sshd_config',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/sshd_config",
    replace => true,
  }
  file { 'set /etc/pam.d/sshd':
    path    => '/etc/pam.d/sshd',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/sshd",
    replace => true,
  }
  file { 'set /etc/pam.d/password-auth':
    path    => '/etc/pam.d/password-auth',
    ensure  => file,
    mode    => "0644",
    source  => "puppet:///modules/ldap_client/password-auth",
    replace => true,
  }

  service { 'sshd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  
}
