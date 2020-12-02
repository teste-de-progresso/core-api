# typed: strict
# frozen_string_literal: true

module Types
  class ResponseErrorType < Types::BaseObject
    field :full_messages, [String], null: false
    field :field_name, String, null: true
    field :messages, [String], null: true
    field :path, [String], null: true
  end
end
