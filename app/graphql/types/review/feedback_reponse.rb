# frozen_string_literal: true

module Types
  module Review
    class FeedbackReponse < Types::BaseObject
      graphql_name "ReviewFeedbackReponse"

      field :payload, Types::Review::Feedback, null: true
      field :errors, [Types::ResponseErrorType], null: true
    end
  end
end
