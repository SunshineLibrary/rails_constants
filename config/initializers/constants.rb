# encoding: UTF-8

(proc do; if not defined? ALREADY_LOAD_RAILS_CONSTANTS
  WHOAMI = `whoami`.strip
  IS_DEBUG = !!ENV['DEBUG']
  IS_RAKE = !!`ps -ef | grep #{Process.pid} | grep -v grep`.split[-1].to_s.match(/rake/)
  require 'socket'
  ip = Socket.ip_address_list.select(&:ipv4_private?).map(&:ip_address).first
  LocalIp = ip if ip

  RailsConstantsRoot = File.expand_path("../../../", __FILE__)
  ProjectRoot = `lsof -p #{Process.pid}`.split("\n").grep(/cwd\ +DIR/)[0].split[-1]
  
  ALREADY_LOAD_RAILS_CONSTANTS = true
end; end).call
