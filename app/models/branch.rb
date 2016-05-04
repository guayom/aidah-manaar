class Branch < ActiveRecord::Base
  has_many :students
  has_many :branch_instructors, class_name: 'BranchInstructor', dependent: :destroy
  has_many :instructors, through: :branch_instructors
  has_many :lessons

  validates_presence_of :name
end
