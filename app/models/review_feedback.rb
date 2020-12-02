# typed: strict
# frozen_string_literal: true

class ReviewFeedback < ApplicationRecord
  belongs_to :review_request
end
