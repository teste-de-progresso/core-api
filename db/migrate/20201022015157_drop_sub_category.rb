# frozen_string_literal: true

class DropSubCategory < ActiveRecord::Migration[6.0]
  def change
    drop_table(:sub_categories) do |t|
      t.string(:name, null: false)
    end
  end
end
