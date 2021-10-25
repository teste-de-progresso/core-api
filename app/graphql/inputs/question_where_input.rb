# frozen_string_literal: true

module Inputs
  class QuestionWhereInput < Types::BaseInputObject
    argument :check_type, [Types::Questions::CheckType], required: false
    argument :status, [Types::Questions::Status], required: false
    argument :difficulty, [Types::Questions::Difficulty], required: false
    argument :bloom_taxonomy, [Types::Questions::BloomTaxonomy], required: false
    argument :authorship_year, [String], required: false
    argument :source, String, required: false
    argument :subject_id, ID, required: false
    argument :user_id, ID, required: false
    argument :create_date, DateRangeInput, required: false
    argument :unifeso_authorship, Boolean, required: false
  end
end
