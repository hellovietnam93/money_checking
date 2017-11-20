class RemoveMonthIdFromIncomes < ActiveRecord::Migration[5.1]
  def change
    remove_column :incomes, :month_id
    remove_column :outcomes, :month_id
  end
end
