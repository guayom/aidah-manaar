class Lesson < ActiveRecord::Base
  belongs_to :branch
  belongs_to :course
  belongs_to :instructor

  validates_presence_of :start_time, :end_time
end
