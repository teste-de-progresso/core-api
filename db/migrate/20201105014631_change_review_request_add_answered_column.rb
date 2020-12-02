# frozen_string_literal: true

class ChangeReviewRequestAddAnsweredColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :review_requests, :answered, :boolean, null: false, default: false
  end
end
