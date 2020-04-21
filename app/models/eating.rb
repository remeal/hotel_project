class Eating < ApplicationRecord
  validates :description, :uniqueness => true
end
