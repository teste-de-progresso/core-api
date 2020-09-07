# frozen_string_literal: true

module Inputs
  module Questions
    class Alternative < Types::BaseInputObject
      graphql_name 'AlternativeInput'

      argument :correct, Boolean, required: false
      argument :text, String, required: false
    end
  end
end
