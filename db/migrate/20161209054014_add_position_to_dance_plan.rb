class AddPositionToDancePlan < ActiveRecord::Migration
  def change
    add_column :dance_plans, :position, :integer
  end
end
