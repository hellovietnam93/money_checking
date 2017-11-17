class AddMainIncomeToIncomes < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :main_income, :boolean, default: false
  end
end
