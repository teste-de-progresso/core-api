# frozen_string_literal: true

module Resolvers
  class QuestionResolver
    def initialize(context, where)
      @current_user = context[:current_user]
      @where = where
    end

    def payload
      questions = QuestionPolicy::Scope.new(@current_user, Question)
                                       .resolve
                                       .order(updated_at: :desc)

      return questions if @where.nil?

      questions.where(@where)
    end
  end
end
