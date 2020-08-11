# frozen_string_literal: true

module Types
  module Questions
    class Objective < Types::BaseObject
      graphql_name 'ObjectiveType'

      field :id, ID, null: false
      field :introduction, String, null: true
      field :body, String, null: true
      field :alternatives, [Alternative], null: true
      field :explanation, String, null: true
      field :status, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
