# OpenVPN Status

A bunch of scripts to get connected clients on OpenVPN.

The solution consists in 2 scripts :

* `openvpn_status.sh`
* `openvpn_status.rb`

`openvpn_status.sh` is an [expect](https://linux.die.net/man/1/expect) script to run a telnet session on [OpenVPN management interface](https://openvpn.net/community-resources/management-interface/) and get clients status.

`openvpn_status.rb` is a Ruby script to beautiful the output.

## Install

```ruby
gem install terminal-table
gem install colorize
```

Puts the `openvpn_status.sh` script in `/usr/local/bin` and `openvpn_status.rb` anywhere you want.

## Example

```sh
root@salt:~# ./openvpn_status.rb
Connected clients
+-------------+----------------------+-----------------+----------------------+----------------+------------+--------------------------+--------------------------+--------------------+-----------+---------+
| Common Name | Real Address         | Virtual Address | Virtual IPv6 Address | Bytes Received | Bytes Sent | Connected Since          | Connected Since (time_t) | Username           | Client ID | Peer ID |
+-------------+----------------------+-----------------+----------------------+----------------+------------+--------------------------+--------------------------+--------------------+-----------+---------+
| myvpn       | xxx.xxx.xxx.xxx:port | 10.2.0.3        |                      | 17907492       | 270980404  | Mon May 27 22:11:07 2019 | 1558987867               | nicoladmin@free.fr | 16        | 0       |
| myvpn       | xxx.xxx.xxx.xxx:port | 10.2.0.2        |                      | 497502         | 3200293    | Mon May 27 22:08:12 2019 | 1558987692               | nicoladmin@free.fr | 14        | 0       |
+-------------+----------------------+-----------------+----------------------+----------------+------------+--------------------------+--------------------------+--------------------+-----------+---------+

Routing table
+-----------------+-------------+----------------------+--------------------------+-------------------+
| Virtual Address | Common Name | Real Address         | Last Ref                 | Last Ref (time_t) |
+-----------------+-------------+----------------------+--------------------------+-------------------+
| 10.2.0.2        | myvpn       | xxx.xxx.xxx.xxx:port | Mon May 27 23:32:58 2019 | 1558992778        |
| 10.2.0.3        | myvpn       | xxx.xxx.xxx.xxx:port | Mon May 27 23:45:14 2019 | 1558993514        |
+-----------------+-------------+----------------------+--------------------------+-------------------+
```
