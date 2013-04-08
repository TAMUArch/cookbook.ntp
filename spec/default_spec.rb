require 'chefspec'

describe 'ntp::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'ntp::daemon' }
  it "does nothing" do
    pending "Does nothing" 
  end
end
