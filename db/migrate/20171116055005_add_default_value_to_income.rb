class AddDefaultValueToIncome < ActiveRecord::Migration[5.1]
  def change
    change_column :incomes, :value, :float, default: 0
    change_column :outcomes, :value, :float, default: 0
  end
end
