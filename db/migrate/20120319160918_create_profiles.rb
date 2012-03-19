class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.string :company
      t.string :kind

      t.timestamps
    end
    Profile.create_translation_table! :bio => :text, :country => :string
  end
  
  def self.down
    drop_table :profiles
    Profile.drop_translation_table!
  end
end
