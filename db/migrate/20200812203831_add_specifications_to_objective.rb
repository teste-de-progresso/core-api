# frozen_string_literal: true

class AddSpecificationsToObjective < ActiveRecord::Migration[6.0]
  def change
    change_table(:objectives, bulk: true) do
      add_column(:objectives, :difficulty, :string)
      add_column(:objectives, :bloom_taxonomy, :string)
      add_column(:objectives, :authorship_year, :string)
      add_column(:objectives, :source, :string)
      add_column(:objectives, :own, :boolean)
    end
  end
end
