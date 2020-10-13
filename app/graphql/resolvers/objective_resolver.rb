# frozen_string_literal: true

module Resolvers
  class ObjectiveResolver
    def initialize(context, where)
      @current_user = context[:current_user]
      @where = where.to_h
    end

    def payload
      questions = QuestionPolicy::Scope.new(@current_user, Objective)
                                       .resolve
                                       .order(updated_at: :desc)

      return questions if @where.nil?

      questions.where(@where)
    end
  end
end
