class CreateItemBuyings < ActiveRecord::Migration[5.1]
  def change
    create_table :item_buyings do |t|
      t.integer :user_id
      t.integer :category_id
      t.float :price
      t.date :estimate_start_time
      t.string :name
      t.string :web_link
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :item_buyings, :user_id
    add_index :item_buyings, :category_id
    add_index :item_buyings, :status
  end
end
