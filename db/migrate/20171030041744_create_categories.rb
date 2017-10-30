class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
    add_index :categories, :creator_id
  end
end
