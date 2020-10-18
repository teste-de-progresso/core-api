# frozen_string_literal: true

class AddJoinTableForAxisAndCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :axes_categories do |t|
      t.integer :axis_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
