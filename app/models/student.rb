class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  enum status: { active: 1, inactive: 2 }

  belongs_to :district
  belongs_to :branch

  has_many :subscriptions
  has_many :active_subscriptions, -> { where('finished_at IS NULL OR finished_at >= CURRENT_TIMESTAMP') }, class_name: 'Subscription'
  has_many :courses_students, class_name: 'CourseStudent', dependent: :destroy

  has_many :courses, through: :courses_students
  has_many :dance_courses, -> { where(kind: 1) }, class_name: 'Course',
           through: :courses_students, source: :course

  has_many :lessons_students, class_name: 'LessonStudent', dependent: :destroy
  has_many :lessons, through: :lessons_students
  has_many :invoices
  has_many :payments
  has_many :visits

  validates_presence_of :first_name, :last_name, :second_last_name, :id_number, :birthdate, :phone
  validates_uniqueness_of :id_number
  validates_length_of :lessons, maximum: 4

  scope :with_pending_invoices, -> { joins(:invoices).where(invoices: { payed: false }) }
  scope :active_students, -> { active }
  scope :inactive_students, -> { inactive }

  include PgSearch
  pg_search_scope :search_by_main_fields, against: [:first_name, :last_name]

  def self.process_all_statuses
    Student.all.each { |s| s.process_status! }
  end

  def process_status!
    if student_is_active?
      update!(status: 'active')
    else
      update!(status: 'inactive')
    end
  end

  def full_name
    "#{first_name} #{last_name} #{second_last_name}"
  end

  def label
    "#{id_number} #{full_name}"
  end

  def address
    "#{district.canton.province}, #{district.canton}, #{district}"
  end

  def create_invoice!
    if active_subscriptions.any? && invoices.where('created_at >= ? ', Date.today.beginning_of_month).empty?
      subscription = active_subscriptions.last

      invoice = invoices.build

      # if dance_courses.any?
      #   prev_invoices_for_that_course = invoices.where('created_at < ?', Date.today).find_all do |i|
      #     i.course_id == dance_courses.first.id
      #   end
      # else
      #   prev_invoices_for_that_course = []
      # end
      # if prev_invoices_for_that_course.empty?
      #   invoice.items.build(name: 'Tuition', price: subscription.tuition)
      # end

      if (Date.today - Date.today.beginning_of_month).days > 10.days
        invoice.items.build(name: 'Plan de danza',
                            price: subscription.price)
      else
        invoice.items.build(name: 'Plan de danza',
                            price: subscription.price,
                            price_with_discount: subscription.price_with_discount)
      end

      invoice.save!

      invoice
    end
  end

  # def check_status!
  #   if invoices.where(payed: false).empty? && active_subscriptions.any?
  #     update!(status: :active)
  #   else
  #     update!(status: :inactive)
  #   end
  # end

  def student_is_active?
    invoices.where(payed: false).empty? && active_subscriptions.any?
  end
  alias_method :student_is_active, :student_is_active?

  def student_is_inactive?
    !student_is_active?
  end

  def dance_courses_for_next_semester
    current_year = CourseStudent::CURRENT_SEMESTER[:year]
    current_semester = CourseStudent::CURRENT_SEMESTER[:semester]
    prev_courses = courses_students.find_all do |cs|
      (cs.year == current_year && cs.semester < current_semester) ||
        (cs.year < current_year)
    end
    prev_courses.map!(&:course)

    next_courses = Course.where(kind: 1).all.find_all do |c|
      prev_courses.include?(c.parent)
    end

    if next_courses.empty?
      [Course.base]
    else
      next_courses
    end
  end

  def last_visit
    visits.order(timestamp: :desc).first
  end
end
