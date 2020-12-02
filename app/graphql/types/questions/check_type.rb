# typed: strict
# frozen_string_literal: true

module Types
  module Questions
    class CheckType < Types::BaseEnum
      value 'unique_answer'
      value 'incomplete_affirmation'
      value 'multiple_answer'
      value 'negative_focus'
      value 'assertion_and_reason'
      value 'gap'
      value 'interpretation'
      value 'association'
      value 'ordering_or_ranking'
      value 'constant_alternatives'
    end
  end
end
