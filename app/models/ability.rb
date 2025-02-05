class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user
      
      if user.super_admin?
        can :manage, :all
      elsif user.owner?
        can [:create ,:update, :edit, :destroy],  Salon , user: user
      else
        can :read, :all
      end
        
  end
end