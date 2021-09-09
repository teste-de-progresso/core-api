# frozen_string_literal: true
class DropReviewFeedback < ActiveRecord::Migration[6.0]
  def change
    drop_table(:review_feedbacks)
  end
end
