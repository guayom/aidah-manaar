class Task < ActiveRecord::Base
  def self.need?(name)
    Task.where(name: name).last.created_at.to_date.beginning_of_month < Date.today.beginning_of_month
  end

  def self.finish!(name)
    Task.create!(name)
  end
end
