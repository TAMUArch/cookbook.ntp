#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, TAMU College of Architecture 
#
# All rights reserved - Do Not Redistribute
#
#
case node["platform_family"]
when "rhel"
  node.set[:ntp][:service] = "ntpd"
when "debian"
  node.set[:ntp][:service] = "ntp"
else
  node.set[:ntp][:service] = "ntp"
end

package "ntp" do
  action [:install]
end

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  variables( {:ntp_servers => ["ntp1.tamu.edu", "ntp2.tamu.edu", "ntp3.tamu.edu"]} )
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[#{node[:ntp][:service]}]" 
end

service node[:ntp][:service] do
  action [:enable,:start]
end
