# frozen_string_literal: true

require 'rails_helper'

describe Types::Review::Request do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:id).of_type 'ID!' }
    it { is_expected.to have_field(:answered).of_type 'Boolean!' }
    it { is_expected.to have_field(:responses).of_type '[ReviewFeedback!]!' }
    it { is_expected.to have_field(:question).of_type 'Question!' }
    it { is_expected.to have_field(:user).of_type 'User!' }
  end
end
