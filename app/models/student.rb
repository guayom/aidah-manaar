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

  def as_json(options = nil)
    attrs = {
      only: [
        'id',
        'email',
        'encrypted_password',
        'reset_password_token',
        'reset_password_sent_at',
        'remember_created_at',
        'sign_in_count',
        'current_sign_in_at',
        'last_sign_in_at',
        'current_sign_in_ip',
        'last_sign_in_ip',
        'created_at',
        'updated_at',
        'first_name',
        'last_name',
        'phone',
        'district_id',
        'branch_id',
        'id_number',
        'beginner',
        'birthdate',
        'second_last_name'
      ]
    }

    super(attrs.merge(options || {}))
  end
end
