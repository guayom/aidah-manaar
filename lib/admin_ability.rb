class AdminAbility
  include CanCan::Ability

  def initialize(admin = Admin.new)
    can :access, :rails_admin
    can :dashboard

    can :index, Admin
    can :manage, Admin, id: admin.id

    can :manage, Instructor
    can :manage, Student
    can :manage, Course
    can :manage, Lesson
  end
end
