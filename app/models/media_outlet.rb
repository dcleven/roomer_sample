class MediaOutlet < Company
  roomer :shared
  
#  attr_accessible :name, :relations_to_owners_attributes, :relations_to_outlets_attributes
  
  has_many :relations_to_advertisers, :foreign_key => 'company_id', :class_name => 'AdvertiserRelationship'
  has_many :advertisers, :through => :relations_to_advertisers, :dependent => :destroy do
    def push_with_attributes(advertiser, join_attrs)
      AdvertiserRelationship.send(:with_scope, :create => join_attrs) { self << advertiser }
    end
  end

  accepts_nested_attributes_for :relations_to_advertisers
    
#  scope :advertisers, joins(:media_outlets).where('advertiser_id is not null')
  
  # has_many :relations_to_owners, :foreign_key => 'owner_id', :class_name => 'OwnerRelationship'
  # has_many :owners, :through => :relations_to_owners, :source => :media_outlet, :dependent => :destroy
  # 
  # has_many :relations_to_outlets, :foreign_key => 'owner_id', :class_name => 'OwnerRelationship'
  # has_many :outlets, :through => :relations_to_outlets, :source => :media_outlet, :dependent => :destroy
 
  has_many    :relations_to_owners,
              :class_name            => "OwnerRelationship",
              :foreign_key           => :child_id,
              :dependent             => :destroy
  has_many    :owners,
              :through               => :relations_to_owners,
              :source                => :parent

  has_many    :relations_to_outlets,
              :class_name            => "OwnerRelationship",
              :foreign_key           => :parent_id,
              :dependent             => :destroy
  has_many    :outlets,
              :through               => :relations_to_outlets,
              :source                => :child
 
 
  def update_outlet(outlet)
    self.outlets << outlet
  end
  
  def add_advertiser(advertiser)
    #self.relations_to_advertisers.build(advertiser)
    self.advertisers << advertiser
  end
    
end
