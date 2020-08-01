# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :save_objective, mutation: Mutations::SaveObjective
  end
end
