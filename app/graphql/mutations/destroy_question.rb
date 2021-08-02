# frozen_string_literal: true
module Mutations
  class DestroyQuestion < BaseMutation
    field :deleted_question_id, ID, null: true

    argument :question_id, Types::RelayId, required: true

    def resolve(question_id:)
      context[:domain] = "Question"

      @question = Question.find(question_id.decoded)

      raise Pundit::NotAuthorizedError unless QuestionPolicy.new(context[:current_user], @question).destroy?

      if @question.destroy
        { deleted_question_id: question_id.encoded, errors: [] }
      else
        { deleted_question_id: nil, errors: @question.errors.full_messages }
      end

      ReviewerMailer.with(question_id: @question.id, recipient: reviewer)
        .question_deleted_notification.deliver
    rescue Pundit::NotAuthorizedError => e
      { deleted_question_id: nil, errors: [e.message] }
    end

    def reviewer
      @reviewer ||= @question.reviewer
    end
  end
end
