class Lesson < ActiveRecord::Base
  belongs_to :branch
  belongs_to :course
  belongs_to :instructor
end
