
class puppet_agent::config  {

   file { 'set puppet configure file':
     path    => '/etc/puppetlabs/puppet/puppet.conf',
     ensure  => file,
     mode    => "0644",
     source  => "puppet:///modules/puppet_agent/puppet.conf",
     replace => true,
   }

}
