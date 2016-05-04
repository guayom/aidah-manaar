class Course < ActiveRecord::Base
  has_ancestry
  has_many :lessons
end
