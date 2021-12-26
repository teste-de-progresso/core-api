# frozen_string_literal: true

module Types
  class ReviewMessageFeedbackTypeEnum < Types::BaseEnum
    graphql_name "ReviewMessageFeedbackType"

    ReviewMessage.feedback_type.values.each do |feedback_type|
      value feedback_type.upcase, value: feedback_type
    end
  end
end
