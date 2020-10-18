# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewFeedback, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:review_request) }
  end
end
