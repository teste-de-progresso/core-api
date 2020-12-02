# typed: true
# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def is?(role)
    @user.role?(role)
  end

  class Scope
    attr_reader :user, :scope

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
