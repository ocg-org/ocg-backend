class Route < ActiveRecord::Base
  belongs_to :rock
  validates :rock, presence: true
end
