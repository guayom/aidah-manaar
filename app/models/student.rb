class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :district
  belongs_to :branch

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
end
