
node default {
 
  include  common

}

node 'gitlab.cn-north-1.compute.internal'  {

 include common
 include git_ce_server

}




