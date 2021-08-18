# frozen_string_literal: true
class ChangeIntentionColumnOnQuestion < ActiveRecord::Migration[6.0]
  def change
    change_column(:questions, :intention, :text)
  end
end
