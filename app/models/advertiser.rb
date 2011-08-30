class Advertiser < Company
  
  has_many :relations_to_media_outlets, :foreign_key => 'advertiser_id', :class_name => 'AdvertiserRelationship'  
  has_many :media_outlets, :through => :relations_to_media_outlets, :source => :media_outlet

end
