# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
Role.create([
	{:name => 'super_admin'},
	{:name => 'college_admin'},
	{:name => 'user'}
	], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Super Admin', :email => 'admin@collegeradio.com', :password => 'bpsi@123', :password_confirmation => 'bpsi@123', :confirmed_at => Time.now
puts 'New user created:' << user.name
user2 = User.create! :name => 'College Admin', :email => 'collegeadmin@collegeradio.com', :password => 'bpsi@123', :password_confirmation => 'bpsi@123', , :confirmed_at => Time.now
puts 'New user created:' << user2.name
user3 = User.create! :name => 'Normal user', :email => 'user@example.com', :password => 'bpsi@123', :password_confirmation => 'bpsi@123', , :confirmed_at => Time.now
puts 'New user created:' << user3.name
user.add_role :super_admin
user2.add_role :college_admin
user3.add_role :user