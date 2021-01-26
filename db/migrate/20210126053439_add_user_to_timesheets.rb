class AddUserToTimesheets < ActiveRecord::Migration[6.0]
  def change
    add_reference :timesheets, :user, null: false, foreign_key: true
  end
end
