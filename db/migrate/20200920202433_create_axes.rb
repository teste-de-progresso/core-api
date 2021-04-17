# frozen_string_literal: true

class CreateAxes < ActiveRecord::Migration[6.0]
  def change
    create_table(:axes) do |t|
      t.string(:name)
      t.references(:sub_category, null: false, foreign_key: true)

      t.timestamps
    end

    add_index(:axes, :name, unique: true)
  end
end
