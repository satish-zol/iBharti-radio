class Schedule < ActiveRecord::Base
  attr_accessible :end_time, :program_date, :program_name, :scheduled_playlist_name, :start_time
end
