# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::CheckType do
  subject { described_class }

  describe 'values' do
    check_types = %w[
      unique_answer
      incomplete_affirmation
      multiple_answer
      negative_focus
      assertion_and_reason
      gap
      interpretation
      association
      ordering_or_ranking
      constant_alternatives
    ]

    it { expect(described_class.values.keys).to match check_types }
  end
end
