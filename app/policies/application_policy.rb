# frozen_string_literal: true
class ApplicationPolicy
  attr_reader :user, :record, :roles

  def initialize(user, record)
    @user = user
    @record = record
    @roles = user.roles.map { |r| r.name.to_sym }
  end

  def is?(role)
    @roles.any?(role)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError
    end
  end
end
