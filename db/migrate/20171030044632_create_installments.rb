class CreateInstallments < ActiveRecord::Migration[5.1]
  def change
    create_table :installments do |t|
      t.integer :user_id
      t.integer :item_buying_id
      t.float :real_value
      t.integer :value_by_month_id

      t.timestamps
    end
    add_index :installments, :user_id
    add_index :installments, :item_buying_id
    add_index :installments, :value_by_month_id
  end
end
