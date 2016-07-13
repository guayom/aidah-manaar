class Subscription < ActiveRecord::Base
  belongs_to :student
  belongs_to :dance_plan

  delegate :price, to: :dance_plan
  delegate :price_with_discount, to: :dance_plan
  delegate :tuition, to: :dance_plan

  delegate :subscriptions, to: :student

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
    student.invoices.where('created_at >= ? ', Date.today.beginning_of_month).each do |invoice|
      invoice.destroy unless invoice.payed?
    end

    invoice = student.invoices.build
    invoice.items.build(name: 'Tuition', price: tuition)

    if (Date.today - Date.today.beginning_of_month).days > 10
      invoice.items.build(name: 'Dance plan',
                          price: price)
    else
      invoice.items.build(name: 'Dance plan',
                          price: price,
                          price_with_discount: price_with_discount)
    end

    invoice.save!
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
