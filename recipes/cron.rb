#
# Cookbook Name:: ntp
# Recipe:: cron 
#
# Copyright 2013, TAMU College of Architecture 
#
# All rights reserved - Do Not Redistribute
#
#

service node[:ntp][:service] do
  action [ :disable, :stop]
end

cron "ntpdate #{node[:ntp][:servers][0]}" do
  command "/usr/sbin/ntpdate #{node[:ntp][:servers][0]} > /dev/null"
  minute 30
  action :create
end
