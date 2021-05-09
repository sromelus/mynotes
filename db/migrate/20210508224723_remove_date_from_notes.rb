class RemoveDateFromNotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :notes, :date, :datetime
  end
end
