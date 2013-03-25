
case node[:platform_family]
when "rhel"
  default[:ntp][:service] = "ntpd"
when "debian"
  default[:ntp][:service] = "ntp"
else
  default[:ntp][:service] = "ntp"
end

# Add the over ride for this in a seperate cookbook
default[:ntp][:servers]
