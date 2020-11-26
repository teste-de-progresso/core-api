# frozen_string_literal: true

require 'rails_helper'

describe Types::SubjectType do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:id).of_type 'ID!' }
    it { is_expected.to have_field(:name).of_type 'String!' }
    it { is_expected.to have_field(:axis).of_type 'Axis!' }
    it { is_expected.to have_field(:category).of_type 'Category!' }
    it { is_expected.to have_field(:questions).of_type '[QuestionType!]!' }
  end
end
