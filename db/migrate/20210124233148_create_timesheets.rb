class CreateTimesheets < ActiveRecord::Migration[6.0]
  def change
    create_table :timesheets do |t|
      t.string :name
      t.string :date
      t.string :start_time
      t.string :end_time
      t.integer :total_hours
      t.string :comments

      t.timestamps
    end
  end
end
