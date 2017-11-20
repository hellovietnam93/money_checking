class DropTableMonths < ActiveRecord::Migration[5.1]
  def change
    drop_table :months
  end
end
