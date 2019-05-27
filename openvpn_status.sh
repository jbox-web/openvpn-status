#!/usr/bin/expect

spawn telnet localhost 6000
set timeout 10
expect "OpenVPN Management Interface"
send "status 3\r"
expect "END"
send "exit\r"
