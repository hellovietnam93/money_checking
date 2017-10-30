class CreateInComes < ActiveRecord::Migration[5.1]
  def change
    create_table :in_comes do |t|
      t.integer :month_id
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.float :value

      t.timestamps
    end
    add_index :in_comes, :month_id
    add_index :in_comes, :user_id
    add_index :in_comes, :category_id
  end
end
