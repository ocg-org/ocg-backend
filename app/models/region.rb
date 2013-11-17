class TreeValidator < ActiveModel::Validator
  def validate(record)
    if record.parent_region == record
      record.errors[:base] << I18n.t('invalid_parent')
    end
    record.child_regions.each do |child|
      if child == record
        record.errors[:base] << I18n.t('invalid_child')
      end
    end
  end

end


class Region < ActiveRecord::Base
  belongs_to :parent_region, class_name: 'Region', inverse_of: :child_regions
  has_many :child_regions, class_name: 'Region',
    inverse_of: :parent_region, foreign_key: :parent_region_id

  validates_with TreeValidator
end
