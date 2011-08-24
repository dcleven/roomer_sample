class OwnerRelationship < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted
  
  belongs_to :media_outlet, :class_name => 'MediaOutlet', :foreign_key => 'company_id'
  belongs_to :media_outlet, :class_name => 'MediaOutlet', :foreign_key => 'owner_id'
  
end