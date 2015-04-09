# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

college_list = [
  [ "Harvard University", "The crimson runs deep here!" ],
  [ "UC Berkeley", "The best public university in the world!" ],
  [ "Stanford University", "The Ivy of the west coast." ],
  [ "Georgetown University", "A wonderful, small private university in Washington D.C." ]
]

news_list = [
	["Easter College Tour Plan", "Come celebrate easter with this fun free workshop! Only 10 students allowed so it promises to be intimate!", "Monday April 6th"],
	["Common App: Dos and Donts", "Students will speak in a panel setting about the most over and underated common app strategies. Free pizza!", "October 12th, 2014"]
]

user_list = [
	["Alex","Triana","alex.triana2@gmail.com","Student"],
]
admin_list = [
	["Kathryn", "Manclark", "kmanclark@gmail.com"],
	["Katie", "Vinicombe", "jkvinnicombe@verizon.net"]
	["Alex","Triana", "alex.triana2@gmail.com"]
]

User.delete_all

College.delete_all
Update.delete_all

college_list.each do |name, summary|
  College.create!( name: name, summary: summary )
end

news_list.each do |name, summary, date|
  Update.create!( title: name, summary: summary, date: date )
end

user_list.each do |first, last, email, relationship|
	User.create!( first_name: first, last_name: last, email:email, relationship: relationship )
end

admin_list.each do |first, last, email|
	Admin.create!(first_name: first, last_name: last, email: email)
end