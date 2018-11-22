
class git_ce_server::install  {


      package { 'curl':
         ensure  => installed,
         name    => 'curl',
      }
      package { 'policycoreutils-python':
         ensure  => installed,
         name    => 'policycoreutils-python',
      }
      package { 'openssh-server':
         ensure  => installed,
         name    => 'openssh-server',
      }
     
     file { 'set gitlab-ce repo script':
          path    => '/tmp/script.rpm.sh',
          ensure  => file,
          mode    => "0777",
          source  => "puppet:///modules/git_ce_server/script.rpm.sh",
          replace => true,
      }
     exec  {  'create gitlab-ce repo':
          command  => 'sh /tmp/script.rpm.sh',
          path     => '/usr/local/bin/:/bin/',
     }
     exec  {  'install gitlab-ce':
          command  => 'yum install -y gitlab-ce EXTERNAL_URL="http://gitlab.cn-north-1.compute.amazonaws.com.cn:8000"',
          path     => '/usr/local/bin/:/bin/',
     }

}
