require 'chefspec'

supported_platforms = {
  :rhel => "ntpd",
  :debian => "ntp"
}

describe 'ntp::daemon' do
  let (:chef_run) { ChefSpec::ChefRunner.new }
  it "should install the ntp package" do
    chef_run.converge "ntp::daemon"
    chef_run.should install_package 'ntp'
  end
  it "should have a template ntp.conf" do
    chef_run.resources = [{:resource_name => 'template', :name => '/etc/ntp.conf'}]
    expect(chef_run.template('/etc/ntp.conf')).to be
  end

  supported_platforms.each do |platform, service_name|
    it "should start the ntp service ntp for #{platform}" do
      chef_run.resources = [{:resource_name => 'service', :name => service_name}]
      expect(chef_run.service(service_name)).to be 
    end
  end
end
