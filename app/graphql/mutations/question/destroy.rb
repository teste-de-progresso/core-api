# frozen_string_literal: true

module Mutations
  module Question
    class Destroy < BaseMutation
      type Boolean

      argument :question_id, ID, required: true

      def resolve(question_id:)
        question = ::Question.find_by(id: question_id)

        return false unless QuestionPolicy.new(context[:current_user], question).destroy?

        question.destroy!
      end
    end
  end
end
