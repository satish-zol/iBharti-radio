class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :program_name
      t.date :program_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :scheduled_playlist_name

      t.timestamps
    end
  end
end
