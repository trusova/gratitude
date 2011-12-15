# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'SETTING UP EXAMPLE USERS'
user1 = User.create! :email => 'trusova@gmail.com', :password => 'testing', :password_confirmation => 'testing'
puts 'New user created: ' << user1.email
user2 = User.create! :email => 'olga@stitch.es', :password => 'testing', :password_confirmation => 'testing'
puts 'New user created: ' << user2.email
