class AddNoteToIncomes < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :note, :text
  end
end
