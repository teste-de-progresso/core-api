# frozen_string_literal: true
class CreateReviewMessages < ActiveRecord::Migration[6.0]
  def change
    create_table(:review_messages) do |t|
      t.references(:user, null: false, foreign_key: true)
      t.references(:question, null: false, foreign_key: true)
      t.string(:text, null: false)
      t.string(:feedback_type, null: false)

      t.timestamps
    end
  end
end
