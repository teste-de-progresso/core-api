# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::Difficulty do
  subject { described_class }

  describe 'values' do
    it { expect(described_class.values.keys).to match %w[easy medium hard] }
  end
end
