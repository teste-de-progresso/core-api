# typed: true
# frozen_string_literal: true

class AddReferencesFieldToObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :references, :text
  end
end
