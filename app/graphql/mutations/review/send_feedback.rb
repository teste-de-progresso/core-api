# frozen_string_literal: true

module Mutations
  module Review
    class SendFeedback < BaseMutation
      type Types::Review::FeedbackReponse

      argument :feedback, Inputs::Review::SendFeedback, required: true

      def resolve(feedback:)
        @inputs = feedback.to_h

        request = Objective.select(:id)
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

          return { payload: @feedback }
        end

        { errors: ::ResponseError.from_active_record_model(@feedback) }
      end

      private

      def update_request
        @feedback.review_request.update(answered: true)
      end

      def update_question_status
        return unless @inputs[:comment] == :approved

        @feedback.review_request
                 .objective
                 .update(status: :finished)
      end
    end
  end
end
