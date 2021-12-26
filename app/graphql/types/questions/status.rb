# frozen_string_literal: true

module Types
  module Questions
    class Status < Types::BaseEnum
      graphql_name "QuestionStatus"

      value "DRAFT", "draft"
      value "PENDING", "pending"
      value "APPROVED", "approved"
      value "REGISTERED", "registered"
    end
  end
end
