# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Axis, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:categories) }
  end

  describe 'validations' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
