class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.timestamps null: false
    end

    add_attachment :videos, :file
  end

  def down
    drop_table :videos
  end
end
