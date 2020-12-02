# typed: strict
# frozen_string_literal: true

module Inputs
  module Question
    class Alternative < Types::BaseInputObject
      argument :correct, Boolean, required: false
      argument :text, String, required: false
    end
  end
end
