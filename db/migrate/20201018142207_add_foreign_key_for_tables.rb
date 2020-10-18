# frozen_string_literal: true

class AddForeignKeyForTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :sub_categories, :category, foreign_key: true
    add_reference :subjects, :category, foreign_key: true
    add_reference :subjects, :sub_category, foreign_key: true
  end
end
