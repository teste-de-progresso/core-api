# frozen_string_literal: true

class RemoveColumnsForDataBaseRemodeling < ActiveRecord::Migration[6.0]
  def change
    remove_column :axes, :sub_category_id, :integer
    remove_column :sub_categories, :category_id, :integer
    remove_column :subjects, :axis_id, :integer
  end
end
