# frozen_string_literal: true
module Resolvers
  class SubjectsQueryResolver
    def initialize(scope, context)
      @scope = scope
      @context = context
    end

    def resolve
      SubjectPolicy::Scope.new(@context[:current_user], @scope).resolve
    end
  end
end
