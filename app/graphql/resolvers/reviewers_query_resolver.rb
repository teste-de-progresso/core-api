# frozen_string_literal: true
module Resolvers
  class ReviewersQueryResolver
    def initialize(scope, context)
      @scope = scope
      @context = context
    end

    def resolve
      UserPolicy::Scope.new(@context[:current_user], @scope)
        .resolve
        .joins(:roles)
        .where(roles: { name: %i[teacher nde] })
        .where.not(id: @context[:current_user].id)
        .distinct
    end
  end
end
