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
    @user.persisted?
  end

  def show?
    @user.persisted?
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
    @record.user_id == @user.id && @record.status != 'finished'
  end

  def finish?
    (is?(:admin) || @record.user_id == @user.id) && @record.status.to_sym == :approved
  end

  def permissions
    PERMISSIONS.select { |method| send("#{method}?") }
  end
end
