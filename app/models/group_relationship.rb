class GroupRelationship < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted
  
  belongs_to :parent, :class_name => 'TenantOutlet'
  belongs_to :child, :class_name => 'TenantOutlet'
end
