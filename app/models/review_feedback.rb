# frozen_string_literal: true

class ReviewFeedback < ApplicationRecord
  belongs_to :review_request
  has_one :user, through: :review_request
end
