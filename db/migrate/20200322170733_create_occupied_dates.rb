class CreateOccupiedDates < ActiveRecord::Migration[6.0]
  def change
    create_table :occupied_dates do |t|
      t.belongs_to :room, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
