class BranchInstructor < ActiveRecord::Base
  self.table_name = 'branches_instructors'

  belongs_to :branch
  belongs_to :instructor
end
