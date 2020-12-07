# frozen_string_literal: true

class ReviewFeedback < ApplicationRecord
  extend Enumerize

  belongs_to :review_request
  has_one :user, through: :review_request

  enumerize :status, in: %i[comment approve request_change]

  default_scope { order(created_at: :desc) }
end
