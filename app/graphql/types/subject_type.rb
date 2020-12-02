# typed: strict
# frozen_string_literal: true

module Types
  class SubjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :axis, AxisType, null: false
    field :category, CategoryType, null: false
    field :questions, [Questions::Base], null: false
  end
end
