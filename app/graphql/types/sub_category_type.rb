# frozen_string_literal: true

module Types
  class SubCategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :category, CategoryType, null: false
    field :axies, [AxisType], null: false
  end
end
