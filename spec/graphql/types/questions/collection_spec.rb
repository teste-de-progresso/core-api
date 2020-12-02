# frozen_string_literal: true

require 'rails_helper'

describe Types::Questions::Collection do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:payload).of_type 'QuestionCollectionPageType!' }
  end
end
