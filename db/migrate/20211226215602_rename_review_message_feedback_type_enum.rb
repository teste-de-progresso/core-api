# frozen_string_literal: true
class RenameReviewMessageFeedbackTypeEnum < ActiveRecord::Migration[6.0]
  def up
    execute(
      "UPDATE review_messages SET feedback_type = 'with_requested_changes' WHERE feedback_type = 'request_changes'"
    )
    execute(
      "UPDATE review_messages SET feedback_type = 'approved' WHERE feedback_type = 'approve'"
    )
  end

  def down
    execute(
      "UPDATE review_messages SET feedback_type = 'request_changes' WHERE feedback_type = 'with_requested_changes'"
    )
    execute(
      "UPDATE review_messages SET feedback_type = 'approve' WHERE feedback_type = 'approved'"
    )
  end
end
