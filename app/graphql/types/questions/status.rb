# frozen_string_literal: true

module Types
  module Questions
    class Status < Types::BaseEnum
      graphql_name "QuestionStatus"

      Question.status.values.each do |status|
        value status.upcase, value: status
      end
    end
  end
end
