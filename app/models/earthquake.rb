class Earthquake < ApplicationRecord
  validates :magnitude, :location, :depth, presence: true
end
