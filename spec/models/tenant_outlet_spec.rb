require 'spec_helper'

describe TenantOutlet do
  before(:each) do
    @tenant = Tenant.create :url_identifier => 'emmis.example.com', :schema_name => 'emmis'
    Roomer.current_tenant = @tenant
    @outlet = MediaOutlet.create :name => 'KAAA-AM'
    @tenant_outlet = TenantOutlet.create! :media_outlet => @outlet, :name => @outlet.name, :type => 'MediaOutlet'
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
  
  it "should be part of a group" do
    @owner = MediaOutlet.create! :name => 'Media Organization'
    @tenant_owner = TenantOutlet.create! :media_outlet => @owner, :name => 'Media Org', :type => 'MediaOrganization'
    @tenant_owner.outlets << @tenant_outlet
    @tenant_owner.save!
    @tenant_owner.reload
    @tenant_owner.outlets[0].should == @tenant_outlet
    @tenant_outlet.owners[0].should == @tenant_owner
    
    # a group can be created as a OutletGroup owned by the MediaOrganization and owning MediaOutlets
    # Media Org owns the SF Market which owns KAAA-AM
    @tenant_group = TenantOutlet.create! :media_outlet => @owner, :name => 'SF Market', :type => 'OutletGroup'
    @tenant_group.owners << @tenant_owner
    @tenant_group.outlets << @tenant_outlet
    @tenant_group.save!
    @tenant_owner.reload
    @tenant_owner.outlets[1].should == @tenant_group
    @tenant_group.outlets[0].should == @tenant_outlet
  end
end
