# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::BloomTaxonomy do
  subject { described_class }

  describe 'values' do
    it { expect(described_class.values.keys).to(match(%w[remember understand apply analyze evaluate create])) }
  end
end
