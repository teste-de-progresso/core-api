# frozen_string_literal: true

class AddJoinTableForAxisAndCategory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :axes, :categories do |t|
      t.index :axis_id
      t.index :category_id
    end
  end
end
