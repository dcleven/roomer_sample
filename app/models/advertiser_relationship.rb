class AdvertiserRelationship < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted

  belongs_to :advertiser,   :foreign_key => 'advertiser_id'
  belongs_to :media_outlet, :foreign_key => 'company_id'
  
  has_many :addresses, :as => :addressable

  def advertiser=(val)
    @advertiser = val
  end
  
  def advertiser
    @advertiser
  end
end
