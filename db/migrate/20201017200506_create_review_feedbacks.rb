# frozen_string_literal: true

class CreateReviewFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table(:review_feedbacks) do |t|
      t.references(:review_request, null: false, foreign_key: true)
      t.string(:status)
      t.text(:comment)

      t.timestamps
    end
  end
end
