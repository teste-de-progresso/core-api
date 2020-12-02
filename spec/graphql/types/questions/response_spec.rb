# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::Response do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:payload).of_type 'QuestionType' }
    it { is_expected.to have_field(:errors).of_type '[ResponseError!]' }
  end
end
