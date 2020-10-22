# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:axis) }
    it { is_expected.to belong_to(:category) }

    it { is_expected.to have_many(:objectives) }
  end

  describe 'validations' do
    subject { described_class.create }

    it { is_expected.to validate_presence_of(:name) }

    # https://github.com/thoughtbot/shoulda-matchers/blob/585f651460026045f590ea27e14f6c5f09e8e6c4/lib/shoulda/matchers/active_model/validate_uniqueness_of_matcher.rb#L28
    # it { is_expected.to validate_uniqueness_of(:name) }
  end
end
