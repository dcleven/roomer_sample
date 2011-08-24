require 'spec_helper'

describe CompaniesController do
  before(:each) do
    Tenant.create :url_identifier => 'emmis.example.com', :schema_name => 'emmis'
    @request.host = "emmis.example.com"
    
    # @subdomain = 'emmis'
    # controller.should_receive(:current_subdomain).and_return(@subdomain)
    # @request.host = "#{@subdomain}.test.host"
  end
  
  describe "POST 'create'" do
    it "should create a Company" do
#      { :post => "http://test.example.com" }.should route_to(:controller => :companies, :action => :create, :subdomain => 'test')
      post :create, :name => 'test'
      response.should be_success
    end    
  end
  
  describe "PUT 'update" do
    before(:each) do
      @owner = MediaOutlet.create :name => 'Corp Owner'
      @outlet = MediaOutlet.create :name => 'Outlet'
    end
    
    it "should update relationship" do
      @owner.should_not be_nil
      @outlet.should_not be_nil
      put :update, :id => @owner.id, :company => @owner.to_json, :outlet => @outlet
      #@owner.reload.outlets[0].should == @outlet
    end
  end
end
