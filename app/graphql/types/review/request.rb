# frozen_string_literal: true

module Types
  module Review
    class Request < Types::BaseObject
      graphql_name 'ReviewRequestType'

      field :id, ID, null: false
      field :answered, Boolean, null: false
      field :responses, [Feedback], null: false
      field :question, Types::Questions::Base, null: false
      field :user, Types::Core::User, null: false

      def responses
        object.review_feedbacks
      end
    end
  end
end
