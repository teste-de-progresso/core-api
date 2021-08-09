# frozen_string_literal: true

module Mutations
  class CreateFeedback < BaseMutation
    field :feedback, Types::Review::Feedback, null: true

    argument :feedback, Inputs::Review::SendFeedback, required: true

    def resolve(feedback:)
      @inputs = feedback.to_h

      request = ::Question.select(:id)
        .find(@inputs[:question_id])
        .review_requests
        .where(user_id: context[:current_user].id)
        .order(created_at: :desc).first

      @feedback = ReviewFeedback.new(
        review_request_id: request.id,
        status: @inputs[:status],
        comment: @inputs[:comment]
      )

      if @feedback.save
        update_request
        update_question_status

        return { feedback: @feedback, errors: [] }
      end

      { feedback: nil, errors: @feedback.errors.full_messages }
    end

    private

    def update_request
      @feedback.review_request.update(answered: (@inputs[:status].to_sym == :approve))
    end

    def update_question_status
      return if @inputs[:status].to_sym != :approve

      @feedback.review_request
        .question
        .update(status: :approved)
    end
  end
end
