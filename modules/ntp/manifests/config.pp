class ntp::config {

file { '/etc/ntp.conf':
    path    => '/etc/ntp.conf',
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => "0644",
    replace => true,
    source  => "puppet:///modules/ntp/ntp.conf",
  }


}
