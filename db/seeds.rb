# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

college_list = [
  [ "Harvard University", "Nov 1st, 2015",
  	"The best and worst part of this campus is the size. It's large enough that I can guaranteee you will find the perfect club
  	or student organization for you. But it can definitely be overwhelming.", "Davey Crocket", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus sed lorem et commodo. Aenean non orci feugiat, euismod mauris nec, ultrices eros. Aenean luctus dui egestas augue ultrices, quis iaculis lorem dictum. Maecenas eleifend a nisl a aliquet. Phasellus vulputate orci a nisl dictum ultricies bibendum eget leo. Curabitur diam libero, tempor nec massa non, ultrices fringilla orci. Donec leo tellus, convallis et est pretium, consequat pellentesque justo. Donec erat elit, faucibus in iaculis eu, laoreet non arcu. Sed ut blandit sem. Etiam sit amet nunc porttitor, porttitor nulla et, iaculis leo. Maecenas mollis sem nisi, nec aliquam odio vehicula in. Aenean aliquam justo quis nulla euismod rutrum. Phasellus pulvinar dolor a sapien gravida, a pellentesque ipsum rhoncus. Pellentesque commodo blandit ante vitae tincidunt."],
  	[ "Harvard University", "Nov 1st, 2015",
  	"The best and worst part of this campus is the size. It's large enough that I can guaranteee you will find the perfect club
  	or student organization for you. But it can definitely be overwhelming.", "Davey Crocket", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus sed lorem et commodo. Aenean non orci feugiat, euismod mauris nec, ultrices eros. Aenean luctus dui egestas augue ultrices, quis iaculis lorem dictum. Maecenas eleifend a nisl a aliquet. Phasellus vulputate orci"],
  	[ "Harvard University", "Nov 1st, 2015",
  	"The best and worst part of this campus is the size. It's large enough that I can guaranteee you will find the perfect club
  	or student organization for you. But it can definitely be overwhelming.", "Davey Crocket", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus sed lorem et commodo. Aenean non orci feugiat, euismod mauris nec, ultrices eros. Aenean luctus dui egestas augue ultrices, quis iaculis lorem dictum. Maecenas eleifend a nisl a aliquet. Phasellus vulputate orci"]
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
	["Katie", "Vinicombe", "jkvinnicombe@verizon.net"],
	["Alex","Triana", "alex.triana2@gmail.com"]
]

User.delete_all

College.delete_all
Update.delete_all

college_list.each do |name, deadline, quote, author, summary|
  College.create!( name: name, summary: summary, deadline: deadline, quote: quote, quote_author: author )
end

news_list.each do |name, summary, date|
  Update.create!( title: name, summary: summary, date: date )
end

user_list.each do |first, last, email, relationship|
	User.create!( first_name: first, last_name: last, email:email, relationship: relationship )
end

admin_list.each do |first, last, email|
	Admin.create!(first_name: first, last_name: last, email: email, password: "Bruins34")
end