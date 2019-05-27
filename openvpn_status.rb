#!/usr/bin/env ruby

require 'yaml'
require 'terminal-table'
require 'colorize'

REGEX   = /status 3([\w\s\.\-\[\]\(\)\/\:\@]*)END/.freeze
HEADERS_CLIENTS = ['Common Name', 'Real Address', 'Virtual Address', 'Virtual IPv6 Address', 'Bytes Received', 'Bytes Sent', 'Connected Since', 'Connected Since (time_t)', 'Username', 'Client ID', 'Peer ID'].map(&:bold)
HEADERS_ROUTES  = ['Virtual Address', 'Common Name', 'Real Address', 'Last Ref', 'Last Ref (time_t)'].map(&:bold)

def create_table(lines)
  clients = []
  routes  = []

  lines.each do |l|
    title, *fields = l.split("\t")
    next if fields.empty?

    clients << fields.map(&:strip) if title == 'CLIENT_LIST'
    routes  << fields.map(&:strip) if title == 'ROUTING_TABLE'
  end

  puts 'Connected clients'.bold
  puts Terminal::Table.new(rows: clients, headings: HEADERS_CLIENTS)

  puts ''

  puts 'Routing table'.bold
  puts Terminal::Table.new(rows: routes, headings: HEADERS_ROUTES)
end

out = %x(/usr/local/bin/openvpn_status.sh)
status = out.match(REGEX)
status = status[1]
lines  = status.split("\n")
create_table(lines)
