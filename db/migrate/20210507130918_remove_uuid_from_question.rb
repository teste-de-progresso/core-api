# frozen_string_literal: true
class RemoveUuidFromQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column(:questions, :uuid)
  end
end
