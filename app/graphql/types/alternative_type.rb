# frozen_string_literal: true

module Types
  class AlternativeType < Types::BaseObject
    field :identifier, String, null: false
    field :text, String, null: true
    field :explanation, String, null: true
  end
end
