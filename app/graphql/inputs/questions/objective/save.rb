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
        argument :status, String, required: false
      end
    end
  end
end
