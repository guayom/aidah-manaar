class ConnectBranchAndInstructor < ActiveRecord::Migration
  def change
    create_table :branches_instructors do |t|
      t.belongs_to :branch, index: true
      t.belongs_to :instructor, index: true
    end
  end
end
