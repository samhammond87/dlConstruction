# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

timesheet_name = ["Sam", "Yee", "Tracy"]

if Timesheet.all.length == 0
	timesheet_name.each do |timesheet|
	Timesheet.create(name: timesheet)
	puts "create #{timesheet} timesheet"
	end
end
