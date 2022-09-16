class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    if user.role == 'admin'
      can :manage, :all
    elsif can :manage, Group, user_id: user.id
      can :manage, Deal, user_id: user.id
    end
  end
end
