# frozen_string_literal: true

module Types
  module Questions
    class Status < Types::BaseEnum
      graphql_name "QuestionStatus"

      value "draft"
      value "pending"
      value "approved"
      value "finished"
    end
  end
end
