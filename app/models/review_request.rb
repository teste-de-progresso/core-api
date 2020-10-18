# frozen_string_literal: true

class ReviewRequest < ApplicationRecord
  belongs_to :objective
  belongs_to :user
  has_many :review_feedbacks, dependent: :destroy
end
