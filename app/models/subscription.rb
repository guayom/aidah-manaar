class Subscription < ActiveRecord::Base
  belongs_to :student
  belongs_to :dance_plan

  delegate :price, to: :dance_plan
  delegate :price_with_discount, to: :dance_plan
  delegate :tuition, to: :dance_plan

  default_scope do
    order(created_at: :desc)
  end

  before_create do
    # We should stop current active subscription.
    student.active_subscriptions.each do |s|
      s.finished_at = Date.today
      s.save!
    end
  end

  after_create do
    student.create_invoice!(self)
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
