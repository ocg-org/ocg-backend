class Route < ActiveRecord::Base
  belongs_to :rock
  validates :rock, presence: true

  acts_as_taggable_on :material
end
