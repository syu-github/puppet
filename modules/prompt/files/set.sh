#!/bin/bash
date >> set.log
whoami >> set.log
pwd >> set.log
#echo "export PS1='\e[0;31m[\u@\h \W]\$ \e[m'" >> /etc/bashrc
echo $PS1  >> set.log
