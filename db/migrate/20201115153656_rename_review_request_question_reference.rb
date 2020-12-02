# typed: true
# frozen_string_literal: true

class RenameReviewRequestQuestionReference < ActiveRecord::Migration[6.0]
  def change
    rename_column :review_requests, :objective_id, :question_id
  end
end
