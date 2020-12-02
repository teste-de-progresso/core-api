# typed: strict
# frozen_string_literal: true

class ReviewRequest < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :review_feedbacks, dependent: :destroy
end
