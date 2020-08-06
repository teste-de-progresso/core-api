# frozen_string_literal: true

module Inputs
  module Questions
    module Objective
      class Alternative < Types::BaseInputObject
        graphql_name 'alternativeInput'

        argument :correct, Boolean, required: false
        argument :text, String, required: false
      end
    end
  end
end
