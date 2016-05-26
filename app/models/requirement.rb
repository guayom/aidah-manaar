class Requirement < ActiveRecord::Base
  belongs_to :course
  belongs_to :requirement, class_name: 'Course'
end
