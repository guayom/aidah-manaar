class RenameTimeToTimestampInVisit < ActiveRecord::Migration
  def change
    rename_column :visits, :time, :timestamp
  end
end
