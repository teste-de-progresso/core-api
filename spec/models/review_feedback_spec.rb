# frozen_string_literal: true

# == Schema Information
#
# Table name: review_feedbacks
#
#  id                :bigint           not null, primary key
#  comment           :text
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  review_request_id :bigint           not null
#
# Indexes
#
#  index_review_feedbacks_on_review_request_id  (review_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (review_request_id => review_requests.id)
#
require 'rails_helper'

RSpec.describe(ReviewFeedback, type: :model) do
  describe 'associations' do
    it { is_expected.to(belong_to(:review_request)) }
    it { is_expected.to(have_one(:user)) }
  end
end
