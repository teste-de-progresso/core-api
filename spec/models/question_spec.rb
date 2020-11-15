# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Objective, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:subject).optional(:true) }
    it { is_expected.to have_many(:review_requests) }
  end
end
