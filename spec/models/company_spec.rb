require 'spec_helper'

describe Company do

  before(:each) do
    @tenant = Tenant.create :url_identifier => 'emmis.example.com', :schema_name => 'emmis'
    Roomer.current_tenant = @tenant
    @attr = {:name => 'media outlet'}
  end
  
  it "should create media outlet" do
    outlet = MediaOutlet.create! @attr 
  end
  
  it "should relate owner to outlet" do
    outlet = MediaOutlet.create! @attr
    outlet.outlets << (MediaOutlet.create! @attr.merge(:name => 'station'))
  end
  
  it "should relate outlet to advertiser" do
    outlet = MediaOutlet.create! @attr
    outlet.advertisers << (Advertiser.create! @attr.merge(:name => 'advertiser'))    
  end
  
  it "should the same advertiser with outlet specific data" do
    owner = MediaOutlet.create! @attr.merge(:name => 'owner')
    owner.outlets << (stn1 = MediaOutlet.create! @attr.merge(:name => 'station 1'))
    owner.outlets << (stn2 = MediaOutlet.create! @attr.merge(:name => 'station 2'))
    adv = Advertiser.create! @attr.merge(:name => 'advertiser')
    stn1.add_advertiser(adv)
    binding.pry
  end
  
end
