# frozen_string_literal: true

module Types
  class ReviewMessageFeedbackTypeEnum < Types::BaseEnum
    graphql_name "ReviewMessageFeedbackType"

    value "comment"
    value "approve"
    value "request_changes"
  end
end
