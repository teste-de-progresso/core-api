# typed: true
# frozen_string_literal: true

class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :axis, null: false, foreign_key: true

      t.timestamps
    end

    add_index :subjects, :name, unique: true
  end
end
