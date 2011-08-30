class AdvertiserRelationship < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted
  #attr_accessible :separation
#  belongs_to :media_outlet, :class_name => 'Company', :foreign_key => 'company_id'
#  belongs_to :advertiser, :class_name => 'Company', :foreign_key => 'advertiser_id'
  belongs_to :advertiser
  belongs_to :media_outlet, :foreign_key => 'company_id'
  
  accepts_nested_attributes_for :advertiser
  
end
