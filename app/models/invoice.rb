class Invoice < ActiveRecord::Base

  belongs_to :student

  has_many :items, class_name: 'InvoiceItem', inverse_of: :invoice
  accepts_nested_attributes_for :items, allow_destroy: true

  has_many :payments

  after_create do
    send!
  end

  def send!
    SendInvoiceJob.perform_later(self)

    update!(sent: true)
  end

  # RAILS_ADMIN_CONFIG

  rails_admin do
    list do
      field :id
      field :payed
      field :payments_for_invoice do
        pretty_value do
          path = bindings[:view].index_path(
            model_name: 'payment',
            f: { invoice: { rand(1000000) => { o: 'is', v: bindings[:object].id } } }
          )
          "<a href=#{path}>Payments</a>".html_safe
        end
      end
      field :student
      field :created_at
    end
  end
end
