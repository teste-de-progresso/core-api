# frozen_string_literal: true
module Resolvers
  class QuestionsQueryResolver
    def initialize(scope, where, context)
      @where = where.to_h
      @scope = scope
      @context = context
    end

    def resolve
      create_date_range = @where.delete(:create_date)
      @where[:created_at] = create_date_range[:start_at]..create_date_range[:end_at] if create_date_range

      QuestionPolicy::Scope.new(@context[:current_user], @scope).resolve.where(@where).order(updated_at: :desc)
    end
  end
end
