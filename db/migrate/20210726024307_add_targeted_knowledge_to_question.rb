# frozen_string_literal: true
class AddTargetedKnowledgeToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column(:questions, :targeted_knowledge, :string)
  end
end
