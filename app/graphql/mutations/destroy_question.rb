# frozen_string_literal: true

module Mutations
  class DestroyQuestion < BaseMutation
    field :deleted_question_id, ID, null: true

    argument :question_id, ID, required: true

    def resolve(question_id:)
      question = ::Question.find_by(id: question_id)

      raise Pundit::NotAuthorizedError unless QuestionPolicy.new(context[:current_user], question).destroy?

      if question.destroy
        { deleted_question_id: question_id, errors: [] }
      else
        { deleted_question_id: nil, errors: question.errors.full_messages }
      end

    rescue Pundit::NotAuthorizedError => e
      { deleted_question_id: nil, errors: [e.message] }
    end
  end
end
