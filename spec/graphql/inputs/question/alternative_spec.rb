# frozen_string_literal: true

require 'rails_helper'

describe Inputs::Question::Alternative do
  subject { described_class }

  describe 'arguments' do
    it { is_expected.to accept_argument(:correct).of_type 'Boolean' }
    it { is_expected.to accept_argument(:text).of_type 'String' }
  end
end
