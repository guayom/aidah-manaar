class Task < ActiveRecord::Base
  def self.need?(name)
    last_task = Task.where(name: name).last
    last_task.blank? || (last_task.created_at.to_date.beginning_of_month < Date.today.beginning_of_month)
  end

  def self.finish!(name)
    Task.create!(name)
  end
end
