class CreateOutComes < ActiveRecord::Migration[5.1]
  def change
    create_table :out_comes do |t|
      t.integer :month_id
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.float :value

      t.timestamps
    end
    add_index :out_comes, :month_id
    add_index :out_comes, :user_id
    add_index :out_comes, :category_id
  end
end
