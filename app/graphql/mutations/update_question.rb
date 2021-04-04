# frozen_string_literal: true

module Mutations
  class UpdateQuestion < BaseMutation
    type Types::Questions::Response

    argument :question, Inputs::QuestionUpdateInput, required: true

    def resolve(question:)
      question = question.to_h
      reviewer_user_id = question.delete(:reviewer_user_id)

      record = Question.find(question[:id])
      policy = QuestionPolicy.new(context[:current_user], record)

      return {} unless policy.update?

      ActiveRecord::Base.transaction do
        record.update!(question)

        review_request = record.review_requests.find_or_create_by!(
          user_id: reviewer_user_id
        )

        review_request.update!(answered: false)

        { payload: record }
      rescue ActiveRecord::RecordInvalid
        { errors: ResponseError.from_active_record_model(record) }
      end
    end
  end
end
