# frozen_string_literal: true
class RenameQuestionStatusEnums < ActiveRecord::Migration[6.0]
  def up
    execute("UPDATE questions SET status = 'registered' WHERE status = 'finished'")
    execute("UPDATE questions SET status = 'waiting_review' WHERE status = 'pending'")
  end

  def down
    execute("UPDATE questions SET status = 'finished' WHERE status = 'registered'")
    execute("UPDATE questions SET status = 'pending' WHERE status = 'waiting_review'")
  end
end
