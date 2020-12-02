# typed: false
# frozen_string_literal: true

require 'rails_helper'

describe Types::Review::FeedbackStatus do
  subject { described_class }

  describe 'values' do
    it { expect(described_class.values.keys).to match %w[comment approve request_change] }
  end
end
