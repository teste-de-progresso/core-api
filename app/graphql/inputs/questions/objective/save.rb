# frozen_string_literal: true

module Inputs
  module Questions
    module Objective
      class Save < Types::BaseInputObject
        graphql_name 'saveOjectiveInput'

        argument :id, ID, required: false
        argument :body, String, required: false
        argument :alternatives, [Alternative], required: false
        argument :explanation, String, required: false
        argument :status, Types::Questions::Status, required: false

        argument :difficulty, Types::Questions::Difficulty, required: false
        argument :bloom_taxonomy, Types::Questions::BloomTaxonomy, required: false
        argument :authorship_year, String, required: false
        argument :source, String, required: false
        argument :own, Boolean, required: false

        argument :user_id, Integer, required: false
      end
    end
  end
end
