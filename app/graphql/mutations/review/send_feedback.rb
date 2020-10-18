# frozen_string_literal: true

module Mutations
  module Review
    class SendFeedback < BaseMutation
      type Types::Review::FeedbackReponse

      argument :feedback, Inputs::Review::SendFeedback, required: true

      def resolve(feedback:)
        inputs = feedback.to_h

        request = Objective.select(:id)
                           .find(inputs[:question_id])
                           .review_requests
                           .where(user_id: context[:current_user].id)
                           .order(created_at: :desc).first

        feedback = ReviewFeedback.new(
          review_request_id: request.id,
          status: inputs[:status],
          comment: inputs[:comment]
        )

        return { payload: feedback } if feedback.save

        { errors: ::ResponseError.from_active_record_model(feedback) }
      end
    end
  end
end
