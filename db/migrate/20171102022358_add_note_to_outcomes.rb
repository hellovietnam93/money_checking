class AddNoteToOutcomes < ActiveRecord::Migration[5.1]
  def change
    add_column :outcomes, :note, :text
  end
end
