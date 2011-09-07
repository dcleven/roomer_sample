class TenantOutlet < ActiveRecord::Base
  # tell roomer if this is a shared or tenanted model
  roomer :tenanted
  
  # our parent shared mediaoutlet
  belongs_to  :media_outlet
  
  # our group relationships  
  has_many    :relations_to_owners,
              :class_name            => "GroupRelationship",
              :foreign_key           => :child_id,
              :dependent             => :destroy
  has_many    :owners,
              :through               => :relations_to_owners,
              :source                => :parent

  has_many    :relations_to_outlets,
              :class_name            => "GroupRelationship",
              :foreign_key           => :parent_id,
              :dependent             => :destroy
  has_many    :outlets,
              :through               => :relations_to_outlets,
              :source                => :child

  # media_outlet has many advertisers
  has_many    :relations_to_advertisers, 
              :class_name => 'AdvertiserRelationship',
              :foreign_key => 'company_id'
  has_many    :advertisers, 
              :through => :relations_to_advertisers, 
              :dependent => :destroy do
                def push_with_attributes(join_attrs)
                  AdvertiserRelationship.send(:with_scope, :create => join_attrs) { self << join_attrs[:advertiser] }
                end
              end
  
  # add an advertiser and assoicated attributes specifc to this outlet
  def add_advertiser(join_attrs)
    join_attrs.assert_valid_keys(:advertiser, :separation, :contact)
    self.advertisers.push_with_attributes(join_attrs)
  end
  
end
