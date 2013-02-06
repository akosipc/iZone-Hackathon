class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all

    if user.is_user?
      cannot :dashboard
      cannot :access, :rails_admin
    end
  end
end
