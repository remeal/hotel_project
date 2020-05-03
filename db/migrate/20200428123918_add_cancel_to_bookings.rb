class AddCancelToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :cancel, :boolean, default: false
  end
end
