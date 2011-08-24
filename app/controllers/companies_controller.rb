class CompaniesController < ApplicationController
  
  def show
    
  end

  
  def create
    @company = Company.create(:name => params[:name])
    render :xml => @company, :status => :ok
  end
  
  def update
    @company = MediaOutlet.find params[:id]
    @company.update_outlet(params[:outlet])
    @company.save!
    render :xml => @company, :status => :ok
  end
end
