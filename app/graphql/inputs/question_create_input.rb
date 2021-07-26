# frozen_string_literal: true

module Inputs
  class QuestionCreateInput < Types::BaseInputObject
    argument :instruction, String, required: true
    argument :support, String, required: true
    argument :body, String, required: true
    argument :alternatives, [QuestionAlternativeInput], required: true
    argument :explanation, String, required: true
    argument :references, String, required: true
    argument :authorship_year, String, required: true
    argument :source, String, required: true
    argument :targeted_knowledge, String, required: true

    argument :status, Types::Questions::Status, required: true
    argument :check_type, Types::Questions::CheckType, required: false
    argument :difficulty, Types::Questions::Difficulty, required: false
    argument :bloom_taxonomy, Types::Questions::BloomTaxonomy, required: false

    argument :subject_id, ID, required: false
    argument :reviewer_user_id, ID, required: false
  end
end
