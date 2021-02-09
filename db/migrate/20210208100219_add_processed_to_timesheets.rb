class AddProcessedToTimesheets < ActiveRecord::Migration[6.0]
  def change
    add_column :timesheets, :processed, :boolean, default: false
  end
end
