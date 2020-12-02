# typed: true
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
    @user.admin? || @user.teacher?
  end

  def new?
    create?
  end

  def update?
    @user.admin? || @user.nde? || (@user.teacher? && @record.user_id == @user.id)
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def finish?
    (@user.admin? || @record.user_id == @user.id) && @record.status.to_sym == :approved
  end

  def permissions
    PERMISSIONS.select { |method| send("#{method}?") }
  end
end
