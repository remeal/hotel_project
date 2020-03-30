  class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.belongs_to :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
