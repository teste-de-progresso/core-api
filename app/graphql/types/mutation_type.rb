# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :save_objective, mutation: Mutations::Questions::SaveObjective
  end
end
