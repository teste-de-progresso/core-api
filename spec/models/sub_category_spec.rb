# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    subject { create :sub_category }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
