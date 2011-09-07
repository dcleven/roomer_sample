require 'spec_helper'

describe TenantOutlet do
  before(:each) do
    @tenant = Tenant.create :url_identifier => 'emmis.example.com', :schema_name => 'emmis'
    Roomer.current_tenant = @tenant
    @outlet = MediaOutlet.create :name => 'KAAA-AM'
    @tenant_outlet = TenantOutlet.create! :media_outlet => @outlet, :name => @outlet.name
    @advertiser = Advertiser.create! :name => 'Test Advertiser'
  end
  
  it "should create a TenantOutlet" do
    @tenant_outlet.media_outlet.should == @outlet
  end
  
  it "should have and advertiser with many addresses" do
    @tenant_outlet.add_advertiser(:advertiser => @advertiser, :separation => 100, :contact => 'doug')
    @tenant_outlet.relations_to_advertisers[0].separation.should == 100
    @tenant_outlet.relations_to_advertisers[0].contact.should == 'doug'
    @tenant_outlet.relations_to_advertisers[0].advertiser.should == @advertiser
    
    addr = Address.create :street1 => '101 Empty Saddle Trail', :city => 'Hailey', :state => 'ID', :zip => '83333'
    @tenant_outlet.relations_to_advertisers[0].addresses << addr
    addr = Address.create :street1 => '200 Main', :city => 'Ketchum', :state => 'ID', :zip => '83340'
    @tenant_outlet.relations_to_advertisers[0].addresses << addr
    @tenant_outlet.save
    @tenant_outlet.reload
    @tenant_outlet.relations_to_advertisers[0].addresses.size.should == 2
  end
  
end
