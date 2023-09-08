# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can [:index, :new, :create, :destroy, :edit, :update, :home], Building, user_id: user.id
      can  :show , Building
    else
      can [:home, :read, :show], Building
    end
  end
end
