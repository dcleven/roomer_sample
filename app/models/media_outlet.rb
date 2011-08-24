class MediaOutlet < Company
  roomer :shared
  
  attr_accessible :relations_to_owners_attributes, :relations_to_outlets_attributes
  
  # has_many :relations_to_advertisers, :foreign_key => 'advertiser_id', :class_name => 'AdvertiserRelationship'
  # has_many :advertisers, :through => :relations_to_advertisers, :source => :media_outlet, :dependent => :destroy
  # scope :advertisers, joins(:media_outlets).where('advertiser_id is not null')
  
  has_many :relations_to_owners, :foreign_key => 'owner_id', :class_name => 'OwnerRelationship'
  has_many :owners, :through => :relations_to_owners, :source => :media_outlet, :dependent => :destroy
  
  has_many :relations_to_outlets, :foreign_key => 'company_id', :class_name => 'OwnerRelationship'
  has_many :outlets, :through => :relations_to_outlets, :source => :media_outlet, :dependent => :destroy
  
  def update_outlet(outlet)
    self.outlets << outlet
  end
    
end
