# frozen_string_literal: true

module Inputs
  module Questions
    class SaveObjective < Types::BaseInputObject
      graphql_name 'OjectiveInput'

      argument :id, ID, required: false
      argument :body, String, required: false
      argument :alternatives, [Alternative], required: false
      argument :explanation, String, required: false
      argument :references, String, required: false
      argument :check_type, Types::Questions::CheckType, required: false
      argument :status, Types::Questions::Status, required: false
      argument :difficulty, Types::Questions::Difficulty, required: false
      argument :bloom_taxonomy, Types::Questions::BloomTaxonomy, required: false
      argument :authorship_year, String, required: false
      argument :source, String, required: false
      argument :own, Boolean, required: false
    end
  end
end
