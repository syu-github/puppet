
class prompt {


file { 'set root bash_profile':
  path    => '/root/.bash_profile',
  ensure  => file,
  mode    => "0644",
  source  => "puppet:///modules/prompt/bash_profile",
  replace => true,
}

}
