class Region < ActiveRecord::Base
  belongs_to :parent_region, class_name: 'Region', inverse_of: :child_regions
  has_many :child_regions, class_name: 'Region',
    inverse_of: :parent_region, foreign_key: :parent_region_id
end
