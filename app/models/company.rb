class Company < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :shared
  
  
end
