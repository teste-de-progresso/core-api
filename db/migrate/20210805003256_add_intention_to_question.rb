# frozen_string_literal: true
class AddIntentionToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column(:questions, :intention, :string)
  end
end
