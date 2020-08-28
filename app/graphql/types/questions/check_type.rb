# frozen_string_literal: true

module Types
  module Questions
    class CheckType < Types::BaseEnum
      value 'incomplete_affirmation'
      value 'assertion_reason'
      value 'column_association'
      value 'gap_or_replacement_of_terms'
      value 'multiple_choice_complex'
      value 'sultiple_multiple_choice'
      value 'serialization'
      value 'true_or_false'
    end
  end
end
