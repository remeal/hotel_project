class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :sum
      t.belongs_to :room, null: false, foreign_key: true
      t.date :date_in
      t.date :date_out
      t.integer :number
      t.belongs_to :eating, null: false, foreign_key: true
      t.string :phone
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
