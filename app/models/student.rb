class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :district
  belongs_to :branch

  has_many :courses_students, class_name: 'CourseStudent', dependent: :destroy
  has_many :courses, through: :courses_students

  rails_admin do
    edit do
      exclude_fields :courses_students
    end
  end

  def address
    "#{district.canton.province}, #{district.canton}, #{district}"
  end
end
