class Type < ApplicationRecord
  validates :link, :uniqueness => true
end
