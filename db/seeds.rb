# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

timesheet_name = ["Sam", "Yee", "Tracy"]

if User.count == 0
	User.create(username: "Sam", email: "sam@test.com", password: "password", password_confirmation: "password")
	User.create(username: "Yee", email: "yee@test.com", password: "password2", password_confirmation: "password2")
	User.create(username: "Tracey", email: "tracey@test.com", password: "password3", password_confirmation: "password3")
	User.create(username: "Andrew", email: "bui@test.com", password: "password", password_confirmation: "password", admin: true)
end
# add [user_id: 1] and [user_id: 2] to Timesheet.create

if Timesheet.all.length == 0
	Timesheet.create(user_id: 1, name: "Sam", start_time: "7:00", end_time: "13:00", total_hours: 6, comments: "client was happy with the end result")
	Timesheet.create(user_id: 2, name: "Yee", start_time: "12:00", end_time: "18:00", total_hours: 8, comments: "nothing to report")
	Timesheet.create(user_id: 3, name: "Tracey", start_time: "10:00", end_time: "17:00", total_hours: 7)
end



# if Timesheet.all.length == 0
# 	timesheet_name.each do |timesheet|
# 	Timesheet.create(name: timesheet)
# 	puts "create #{timesheet} timesheet"
# 	end
# end
