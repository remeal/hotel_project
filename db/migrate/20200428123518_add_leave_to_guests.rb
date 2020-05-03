class AddLeaveToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :leave, :boolean, default: false
  end
end
