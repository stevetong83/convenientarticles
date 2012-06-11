class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user

    if user.has_role? :admin
      can :manage, :all
    else
      can :manage, Article do |article|
        article.try(:owner) == user
      end
    end
  end

end
