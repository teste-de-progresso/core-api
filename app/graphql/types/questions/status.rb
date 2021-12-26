# frozen_string_literal: true

module Types
  module Questions
    class Status < Types::BaseEnum
      graphql_name "QuestionStatus"

      value "DRAFT", value: "draft"
      value "WAITING_REVIEW", value: "waiting_review"
      value "APPROVED", value: "approved"
      value "REGISTERED", value: "registered"
    end
  end
end
