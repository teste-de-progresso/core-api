# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewRequest, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:question) }
    it { is_expected.to have_many(:review_feedbacks) }
  end
end
