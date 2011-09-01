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
    outlet.outlets[0].owners[0].should == outlet
  end
  
  it "should relate outlet to advertiser" do
    outlet = MediaOutlet.create! @attr
    outlet.advertisers << (Advertiser.create! @attr.merge(:name => 'advertiser'))
    outlet.advertisers[0].media_outlets[0].should == outlet
  end
  
  
  it "should create an advertiser with outlet specific data" do
    owner = MediaOutlet.create! @attr.merge(:name => 'owner')
    owner.outlets << (stn1 = MediaOutlet.create! @attr.merge(:name => 'station 1'))
    adv1 = Advertiser.create! @attr.merge(:name => 'advertiser 1')
    stn1.add_advertiser(:advertiser => adv1, :separation => 100, :contact => 'doug')
    stn1.relations_to_advertisers[0].separation.should == 100
    stn1.relations_to_advertisers[0].contact.should == 'doug'
    stn1.relations_to_advertisers[0].advertiser.should == adv1
    
    binding.pry
  end
  
end
