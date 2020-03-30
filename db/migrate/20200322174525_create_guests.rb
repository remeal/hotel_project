class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :password
      t.string :surname
      t.string :name
      t.string :patronymic
      t.belongs_to :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
