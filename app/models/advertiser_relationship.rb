class AdvertiserRelationship < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted

  belongs_to :advertiser
  belongs_to :media_outlet, :foreign_key => 'company_id'

  def advertiser=(val)
    @advertiser = val
  end
  
  def advertiser
    @advertiser
  end
end
