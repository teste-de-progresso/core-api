# typed: strict
# frozen_string_literal: true

module Types
  module Questions
    class Alternative < Types::BaseObject
      graphql_name 'AlternativeType'

      field :correct, Boolean, null: false
      field :text, String, null: true
    end
  end
end
