node 'node1' {
        file {'/root/second.txt':
               ensure => present,
               content => "$selinux \n $os.hardware",
       } 
include module1
include module1::a::b
include lint
include users::user11
include users::user21
include group::group11
include group::group21
include webserver::apache
include ntp::ntpconf
#include variables::overwrite
include variables::overwrite1
include variables::inheritance1
}

class {'variables::overwrite1':
    var3 => 'overwritten value' ,
}
node default {
}

file {'/root/first.txt':
       ensure => present,
       content => " ${facts['os']['hardware']} ,$hostname " ,
       }

node 'node2' {
include module1::a::b
include webserver::apache
include ntp::ntpconf
}
