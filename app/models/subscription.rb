class Subscription < ActiveRecord::Base
  belongs_to :student
  belongs_to :dance_plan

  before_create do
    # We should stop current active subscription.
    student.active_subscriptions.each do |s|
      s.finished_at = Date.today
      s.save!
    end
  end

  after_create do
    # Create new invoice if needed.
    # invoice = invoices.build
    # invoice.save!
  end

  rails_admin do
    list do
      field :id
      field :student
      field :dance_plan
      field :created_at
      field :finished_at
    end
  end
end
