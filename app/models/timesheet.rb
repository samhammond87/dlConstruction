class Timesheet < ApplicationRecord
    belongs_to :user
  
    validates :name, presence: true
    validates :date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :total_hours, presence: true


    def transform_timesheet
        return {
            name: self.user.username, # 'self' is similar to using @timesheet
            date: self.date,
            start_time: self.start_time,
            end_time: self.end_time,
            total_hours: self.total_hours,
            comments: self.comments,
            processed: self.processed,
            posted: self.created_at,
            edited: self.updated_at
        }
    end

    # def destroy
    #     if current_user.admin?
    #       @timesheet.destroy
    #     end
    # end
end
