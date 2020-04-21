class Room < ApplicationRecord
  validates :number, :uniqueness => true
  belongs_to :type
end
