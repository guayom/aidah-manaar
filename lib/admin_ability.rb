class AdminAbility
  include CanCan::Ability

  def initialize(admin = Admin.new)
    can :access, :rails_admin
    can :dashboard

    if admin.present?
      can :manage, :all
    end

    cannot :destroy, Invoice
  end
end
