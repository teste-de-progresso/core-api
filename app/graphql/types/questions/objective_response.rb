# frozen_string_literal: true

module Types
  module Questions
    class ObjectiveResponse < Types::BaseObject
      field :payload, Types::Questions::Objective, null: true
      field :errors, [Types::ResponseErrorType], null: true
    end
  end
end
