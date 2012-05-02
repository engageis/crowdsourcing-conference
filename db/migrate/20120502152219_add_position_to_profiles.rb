class AddPositionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :position, :int
  end
end
