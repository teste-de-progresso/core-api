# frozen_string_literal: true

class DropSubCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :subjects, :sub_category_id, :integer

    drop_table :sub_categories do |t|
      t.string :name, null: false
    end
  end
end
