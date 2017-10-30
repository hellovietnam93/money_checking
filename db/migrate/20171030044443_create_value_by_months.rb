class CreateValueByMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :value_by_months do |t|
      t.integer :item_buying_id
      t.float :estimate_value
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :value_by_months, :item_buying_id
  end
end
