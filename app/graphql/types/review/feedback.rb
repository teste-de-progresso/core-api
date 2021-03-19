# frozen_string_literal: true

module Types
  module Review
    class Feedback < Types::BaseObject
      graphql_name 'ReviewFeedback'

      field :id, ID, null: false
      field :status, FeedbackStatus, null: false
      field :comment, String, null: true

      field :user, Types::Core::UserType, null: false

      def user
        dataloader.with(Sources::ActiveRecord, User).load(object.user_id)
      end

      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
