class Address < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted
  
  belongs_to :addressable, :polymorphic => true
end
