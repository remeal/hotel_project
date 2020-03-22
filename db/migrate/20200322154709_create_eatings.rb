class CreateEatings < ActiveRecord::Migration[6.0]
  def change
    create_table :eatings do |t|
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
