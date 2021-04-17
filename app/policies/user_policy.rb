# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.where.not(id: @user.id) if @user.roles.present?

      scope.none
    end
  end
end
