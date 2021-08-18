# frozen_string_literal: true
class RemoveTargetedKnowledgeFromQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column(:questions, :targeted_knowledge)
  end
end
