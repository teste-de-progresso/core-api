# frozen_string_literal: true

class QuestionPolicy < ApplicationPolicy
  PERMISSIONS = %i[
    index
    show
    create
    new
    update
    edit
    destroy
  ].freeze

  def index?
    true
  end

  def show?
    true
  end

  def create?
    is?(:admin) || is?(:teacher)
  end

  def new?
    create?
  end

  def update?
    is?(:admin) || is?(:nde) || (is?(:teacher) && @record.user_id == @user.id)
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def permissions
    PERMISSIONS.select { |method| send("#{method}?") }
  end
end
