# frozen_string_literal: true

class RemoveColumnCorrentAnswerFromObjectives < ActiveRecord::Migration[6.0]
  def change
    remove_column :objectives, :correct_answer, :string
  end
end
