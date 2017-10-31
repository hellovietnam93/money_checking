class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.integer :month_id
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.float :value

      t.timestamps
    end
    add_index :incomes, :month_id
    add_index :incomes, :user_id
    add_index :incomes, :category_id
  end
end
