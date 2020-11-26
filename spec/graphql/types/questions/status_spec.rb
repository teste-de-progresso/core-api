# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::Status do
  subject { described_class }

  describe 'values' do
    it { expect(described_class.values.keys).to match %w[draft pending approved finished] }
  end
end
