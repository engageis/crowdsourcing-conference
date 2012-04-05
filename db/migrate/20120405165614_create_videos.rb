class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :link
      t.string :video_id
      t.string :provider
      t.text :description
      t.string :thumbnail_small
      t.string :thumbnail_large

      t.timestamps
    end
  end
end
