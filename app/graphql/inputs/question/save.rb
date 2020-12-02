# typed: strict
# frozen_string_literal: true

module Inputs
  module Question
    class Save < Types::BaseInputObject
      argument :id, ID, required: false
      argument :instruction, String, required: false
      argument :support, String, required: false
      argument :body, String, required: true
      argument :alternatives, [Alternative], required: true
      argument :explanation, String, required: true
      argument :references, String, required: true
      argument :check_type, Types::Questions::CheckType, required: true
      argument :difficulty, Types::Questions::Difficulty, required: true
      argument :bloom_taxonomy, Types::Questions::BloomTaxonomy, required: true
      argument :authorship_year, String, required: true
      argument :source, String, required: true

      argument :subject_id, ID, required: true
      argument :reviewer_id, ID, required: true
    end
  end
end
