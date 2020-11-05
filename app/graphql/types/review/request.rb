module Types
  module Review
    class Request < Types::BaseObject
      graphql_name 'ReviewRequestType'

      field :id, ID, null: false
      field :answered, Boolean, null: false
      field :responses, [Feedback], null: false
      field :objective, [Types::Questions::Objective], null: false
      field :user, Types::Users::Details, null: false

      def responses
        object.review_feedbacks
      end
    end
  end
end