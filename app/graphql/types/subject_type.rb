# frozen_string_literal: true

module Types
  class SubjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :axis, AxisType, null: false
    field :category, CategoryType, null: false
    field :objectives, [Questions::Objective], null: false, deprecation_reason: 'Depreciated due to questions'
    field :questions, [Questions::Objective], null: false
  end
end
