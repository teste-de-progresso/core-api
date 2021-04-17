# frozen_string_literal: true

class AddColumnExplanationToObjectives < ActiveRecord::Migration[6.0]
  def change
    add_column(:objectives, :explanation, :text)
  end
end
