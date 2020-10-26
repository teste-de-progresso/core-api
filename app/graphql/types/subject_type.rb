# frozen_string_literal: true

module Types
  class SubjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :axis, AxisType, null: true
    field :category, CategoryType, null: true
    field :objectives, [Questions::Objective], null: false
  end
end
