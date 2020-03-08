class AddValuesToTest2 < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      change_table :tests do |t|
        dir.up do
          t.string :test_col
        end

        dir.down do
          t.remove :test_col
        end
      end
    end
  end
end
