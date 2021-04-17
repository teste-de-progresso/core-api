# frozen_string_literal: true

module Types
  module Questions
    class Response < Types::BaseObject
      graphql_name "QuestionResponse"

      field :payload, Types::Questions::Base, null: true
      field :errors, [Types::ResponseErrorType], null: true
    end
  end
end
