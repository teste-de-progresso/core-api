# frozen_string_literal: true

class ReviewRequest < ApplicationRecord
  belongs_to :objective # Depreciated due to question
  belongs_to :question, foreign_key: :objective_id, class_name: 'Question' # TODO: Rename fk
  belongs_to :user
  has_many :review_feedbacks, dependent: :destroy
end
