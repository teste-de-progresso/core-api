# frozen_string_literal: true

class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.roles.present?

      scope.none
    end
  end

  def create?
    is?(:admin) || is?(:teacher)
  end

  def update?
    is?(:admin) || is?(:nde) || (is?(:teacher) && @record.user_id == @user.id)
  end

  def destroy?
    @record.user_id == @user.id && @record.status != 'finished'
  end

  def finish?
    (is?(:admin) || @record.user_id == @user.id) && @record.status.to_sym == :approved
  end
end
