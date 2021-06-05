# frozen_string_literal: true

module Types
  module Questions
    class BloomTaxonomy < Types::BaseEnum
      graphql_name "QuestionBloomTaxonomy"

      value "remember"
      value "understand"
      value "apply"
      value "analyze"
      value "evaluate"
      value "create"
    end
  end
end
