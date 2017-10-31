class CreateOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :outcomes do |t|
      t.integer :month_id
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.float :value

      t.timestamps
    end
    add_index :outcomes, :month_id
    add_index :outcomes, :user_id
    add_index :outcomes, :category_id
  end
end
