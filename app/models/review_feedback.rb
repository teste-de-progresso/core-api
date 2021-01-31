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
class ReviewFeedback < ApplicationRecord
  extend Enumerize

  belongs_to :review_request
  has_one :user, through: :review_request

  enumerize :status, in: %i[comment approve request_change]

  default_scope { order(created_at: :desc) }
end
