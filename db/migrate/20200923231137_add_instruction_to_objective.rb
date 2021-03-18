# frozen_string_literal: true

class AddInstructionToObjective < ActiveRecord::Migration[6.0]
  def change
    add_column(:objectives, :instruction, :text)
  end
end
