class AddDateToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :date, :datetime
  end
end
