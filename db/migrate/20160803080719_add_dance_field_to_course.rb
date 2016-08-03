class AddDanceFieldToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :kind, :integer, default: 1
  end
end
