class CreateSchedules < ActiveRecord::Migration
  def up
    create_table :schedules do |t|
      t.integer :day
      t.time :time

      t.timestamps
    end
    Schedule.create_translation_table! :description => :string
  end

  def down
    drop_table :schedules
    Schedule.drop_translation_table!
  end
end
