class AddValuesToTest < ActiveRecord::Migration[6.0]
  def change
    create_table :test do |t|
      t.string :test_column
    end
  end
end
