class AddMonthToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :month, :date
    add_column :outcomes, :month, :date
  end
end
