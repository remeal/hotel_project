class Booking < ApplicationRecord
  belongs_to :eating
  belongs_to :user
  belongs_to :room
end
