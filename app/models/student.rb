class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :district
  belongs_to :branch

  has_many :subscriptions
  has_many :active_subscriptions, -> { where(finished_at: nil) }, class_name: 'Subscription'
  has_many :courses_students, class_name: 'CourseStudent', dependent: :destroy
  has_many :courses, through: :courses_students
  has_many :lessons_students, class_name: 'LessonStudent', dependent: :destroy
  has_many :lessons, through: :lessons_students
  has_many :invoices
  has_many :payments

  validates_presence_of :first_name, :last_name, :second_last_name, :id_number, :birthdate, :phone
  validates_uniqueness_of :id_number
  validates_length_of :lessons, maximum: 3

  def full_name
    "#{first_name} #{last_name}"
  end

  def label
    "#{id_number} #{full_name}"
  end

  def address
    "#{district.canton.province}, #{district.canton}, #{district}"
  end

  def create_invoice!(subscription)
    last_invoices = invoices.where('created_at >= ? ', Date.today.beginning_of_month)

    is_first_subscription = subscriptions.size <= 1
    prev_subscription = subscriptions.last
    need_to_pay_more = !is_first_subscription && prev_subscription.price < subscription.price

    if is_first_subscription || need_to_pay_more
      last_invoices.each { |invoice| invoice.destroy unless invoice.payed? }

      invoice = invoices.build
      invoice.items.build(name: 'Tuition', price: subscription.tuition)

      if (Date.today - Date.today.beginning_of_month).days > 10
        invoice.items.build(name: 'Dance plan',
                            price: subscription.price)
      else
        invoice.items.build(name: 'Dance plan',
                            price: subscription.price,
                            price_with_discount: subscription.price_with_discount)
      end

      invoice.save!
    end
  end
end
