# frozen_string_literal: true

class CreateObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :body
      t.jsonb :alternatives
      t.string :correct_answer, limit: 1
      t.string :status
      t.references :user

      t.timestamps
    end
  end
end
