class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :link
      t.text :description
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
