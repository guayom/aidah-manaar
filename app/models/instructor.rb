class Instructor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :district

  has_many :branch_instructors, class_name: 'BranchInstructor', dependent: :destroy
  has_many :branches, through: :branch_instructors
  has_many :lessons

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
        'created_at',
        'updated_at',
        'first_name',
        'last_name',
        'phone',
        'district_id',
        'branch_id'
      ]
    }

    super(attrs.merge(options || {}))
  end
end
