# frozen_string_literal: true

module Types
  module Review
    class Feedback < Types::BaseObject
      graphql_name 'ReviewFeedbackType'

      field :id, ID, null: false
      field :status, FeedbackStatus, null: false
      field :comment, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
