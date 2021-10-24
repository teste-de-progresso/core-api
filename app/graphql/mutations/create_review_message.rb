# frozen_string_literal: true

module Mutations
  class CreateReviewMessage < BaseMutation
    field :review_message, Types::ReviewMessageType, null: true

    argument :message, Inputs::ReviewMessageInput, required: true

    def resolve(message:)
      message = message.to_h

      ActiveRecord::Base.transaction do
        record = ReviewMessage.create!({
          **message,
          user_id: current_user.id,
        })

        question = record.question

        question.review_requests.where(user_id: current_user.id).each do |request|
          request.update!(answered: question.user_id != current_user.id)
        end

        question.update!(status: :approved) if message[:feedback_type] == "approve"

        { review_message: record, errors: [] }
      rescue ActiveRecord::RecordInvalid => e
        { review_message: nil, errors: e.record.errors.full_messages }
      end
    rescue Pundit::NotAuthorizedError => e
      { review_message: nil, errors: [e.message] }
    end
  end
end
