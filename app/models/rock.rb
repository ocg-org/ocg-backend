class LeafValidator < ActiveModel::Validator
  def validate(record)
    if record.region.child_regions.count > 0
      record.errors[:base] << I18n.t('invalid_leaf')
    end
  end
end

class Rock < ActiveRecord::Base
  belongs_to :region

  validates_with LeafValidator
end
