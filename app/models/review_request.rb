# frozen_string_literal: true

class ReviewRequest < ApplicationRecord
  belongs_to :objective, foreign_key: :question_id, class_name: 'Question' # Depreciated due to question
  belongs_to :question # TODO: Rename fk
  belongs_to :user
  has_many :review_feedbacks, dependent: :destroy
end
