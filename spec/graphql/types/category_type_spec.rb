# typed: false
# frozen_string_literal: true

require 'rails_helper'

describe Types::CategoryType do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:id).of_type 'ID!' }
    it { is_expected.to have_field(:name).of_type 'String!' }
    it { is_expected.to have_field(:subjects).of_type '[Subject!]!' }
  end
end
