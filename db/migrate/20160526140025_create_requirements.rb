class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.references :course
      t.references :requirement

      t.timestamps null: false
    end
  end
end
