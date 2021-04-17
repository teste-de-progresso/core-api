# frozen_string_literal: true

class SubjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.roles.present?

      scope.none
    end
  end
end
