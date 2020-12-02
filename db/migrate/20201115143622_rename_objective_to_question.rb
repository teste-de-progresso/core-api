# typed: true
# frozen_string_literal: true

class RenameObjectiveToQuestion < ActiveRecord::Migration[6.0]
  def change
    rename_table :objectives, :questions
  end
end
