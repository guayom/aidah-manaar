class AdminAbility
  include CanCan::Ability

  def initialize(admin = Admin.new)
    can :access, :rails_admin
    can :dashboard

    if admin.present?
      can :manage, :all
    end

    # can :index, Admin
    # can :manage, Admin, id: admin.id
    #
    # can :manage, Branch
    # can :manage, Instructor
    # can :manage, Student
    # can :manage, Course
    # can :manage, Lesson
  end
end
