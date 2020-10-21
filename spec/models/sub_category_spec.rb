# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:subjects) }
  end

  describe 'validations' do
    subject { described_class.create }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
