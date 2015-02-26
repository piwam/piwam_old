class Ability
  include CanCan::Ability

  def initialize(member)
    can :manage, :all
  end
end