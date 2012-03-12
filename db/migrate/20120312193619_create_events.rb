class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.timestamps
    end
    Event.create_translation_table! :text => :text
  end

  def self.down
    drop_table :events
    Event.drop_translation_table!
  end
end
