# typed: true
# frozen_string_literal: true

class ApplicationPolicy
  extend T::Sig

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope
    extend T::Sig

    attr_reader :user, :scope

    sig { params(user: User, scope: ActiveRecord::Relation).returns(ActiveRecord::Relation) }
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      user_roles = user.roles.map { |r| r.name.to_sym }

      if user_roles == [:teacher]
        scope.where(user_id: user.id)
      else
        scope.all
      end
    end
  end
end
