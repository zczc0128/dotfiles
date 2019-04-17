#!/usr/bin/expect
set host [lindex $argv 0]

set TERMSERV jump01.bj.sensetime.com
set USER xxx
set PASSWORD xxxx

# 登录跳板机
spawn ssh -l $USER $TERMSERV
expect {
        "yes/no" {send "yes\r";exp_continue;}
         "*password:*" { send "$PASSWORD\r" }
        }
# 登录内网
expect "*zhoumingjun Please enter your Login Ip:" {send "$host\r"}
 
interact
