class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.belongs_to :photo, null: false, foreign_key: true
      t.text :description
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
