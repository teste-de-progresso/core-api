# frozen_string_literal: true

module Mutations
  class CreateQuestion < BaseMutation
    type Types::Questions::Response

    argument :question, Inputs::QuestionCreateInput, required: true

    def resolve(question:)
      question = question.to_h
      reviewer_user_id = question.delete(:reviewer_user_id)

      record = Question.new(question)
      record.user_id = context[:current_user].id

      policy = QuestionPolicy.new(context[:current_user], record)

      return {} unless policy.create?

      ActiveRecord::Base.transaction do
        record.save!
        record.review_requests.create!(user_id: reviewer_user_id) if reviewer_user_id.present?

        { payload: record }
      rescue ActiveRecord::RecordInvalid
        { errors: ResponseError.from_active_record_model(record) }
      end
    end
  end
end
