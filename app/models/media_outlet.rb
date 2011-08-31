class MediaOutlet < Company
  roomer :shared
  
  has_many :relations_to_advertisers, :foreign_key => 'company_id', :class_name => 'AdvertiserRelationship'
  has_many :advertisers, :through => :relations_to_advertisers, :dependent => :destroy do
    def push_with_attributes(join_attrs)
      AdvertiserRelationship.send(:with_scope, :create => join_attrs) { self << join_attrs[:advertiser] }
    end
  end

  
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
  
  def add_advertiser(join_attrs)
    self.advertisers.push_with_attributes(join_attrs)
  end
    
end
