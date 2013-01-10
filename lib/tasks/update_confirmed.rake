namespace :db do
	desc "update user confirmed at field"
	task :update_confirmed => :environment do
		users = User.all
		users.each {|user| user.update_attributes(:confirmed_at => Time.now); puts "#{user.email} has been updated at #{user.confirmed_at}"}
	end
end