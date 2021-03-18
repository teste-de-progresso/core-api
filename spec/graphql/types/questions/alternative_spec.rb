# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::Alternative do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to(have_field(:correct).of_type('Boolean!')) }
    it { is_expected.to(have_field(:text).of_type('String')) }
  end
end
