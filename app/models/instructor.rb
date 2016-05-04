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
end
