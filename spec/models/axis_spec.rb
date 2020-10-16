# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Axis, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:subject) }
    it { is_expected.to have_one(:category) }
  end

  describe 'validations' do
    subject { create :axis }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
