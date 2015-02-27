class Ability
  include CanCan::Ability

  def initialize(member)
    member.permissions.each do |permission|
      can permission.action.to_sym, (permission.controller =~ /^[A-Z]/) ? permission.controller.constantize : permission.controller.to_sym
    end
  end
end