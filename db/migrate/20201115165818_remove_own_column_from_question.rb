# frozen_string_literal: true

class RemoveOwnColumnFromQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :own, :boolean
  end
end
