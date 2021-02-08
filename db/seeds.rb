# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

timesheet_name = ["Sam", "Yee", "Tracy"]

if User.count == 0 && Timesheet.all.length == 0
	User.create(username: "Sam", email: "sam@test.com", password: "CoderAcademy", password_confirmation: "CoderAcademy")
	User.create(username: "Yee", email: "yee@test.com", password: "CoderAcademy", password_confirmation: "CoderAcademy")
	User.create(username: "Tracey", email: "tracey@test.com", password: "CoderAcademy", password_confirmation: "CoderAcademy")
	User.create(username: "Xinyu", email: "nick@dl_constructions.com", password: "CoderAcademy", password_confirmation: "CoderAcademy", admin: true)

# add [user_id: 1] and [user_id: 2] to Timesheet.create

	Timesheet.create(user_id: 1, name: "Sam", start_time: "7am", end_time: "1pm", total_hours: 6, comments: "client was happy with the end result", processed: true)
	Timesheet.create(user_id: 2, name: "Yee", start_time: "12pm", end_time: "6pm", total_hours: 8, comments: "nothing to report")
	Timesheet.create(user_id: 3, name: "Tracey", start_time: "10am", end_time: "5pm", total_hours: 7, comments: "Job took longer than expected due to rain", processed: true)
end



# if Timesheet.all.length == 0
# 	timesheet_name.each do |timesheet|
# 	Timesheet.create(name: timesheet)
# 	puts "create #{timesheet} timesheet"
# 	end
# end
