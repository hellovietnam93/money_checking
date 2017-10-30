class CreateMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :months do |t|
      t.date :value
      t.integer :user_id

      t.timestamps
    end

    add_index :months, :user_id
  end
end
