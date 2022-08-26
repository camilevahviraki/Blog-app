class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    if user.role == 'admin'
      can :manage, Post
      can :manage, Comment
    else
      can :read, Post
      can :read, Comment
    end
  end
end
