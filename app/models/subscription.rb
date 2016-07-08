class Subscription < ActiveRecord::Base
  belongs_to :student
  belongs_to :dance_plan
end
