# frozen_string_literal: true

module Types
  class ObjectiveType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :body, String, null: true
    field :alternatives, [Types::AlternativeType], null: true
    field :correct_answer, String, null: true
    field :status, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
