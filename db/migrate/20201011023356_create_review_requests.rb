# frozen_string_literal: true

class CreateReviewRequests < ActiveRecord::Migration[6.0]
  def change
    create_table(:review_requests) do |t|
      t.references(:objective, null: false, foreign_key: true)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
