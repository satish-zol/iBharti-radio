class RemoveProgramDateFromSchedules < ActiveRecord::Migration
  def up
    remove_column :schedules, :program_date
  end

  def down
    add_column :schedules, :program_date, :date
  end
end
