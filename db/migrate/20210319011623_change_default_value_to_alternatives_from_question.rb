# frozen_string_literal: true

class ChangeDefaultValueToAlternativesFromQuestion < ActiveRecord::Migration[6.0]
  def up
    execute("UPDATE questions SET alternatives = '[]' WHERE alternatives IS NULL")

    change_column_default(:questions, :alternatives, from: nil, to: [])
    change_column_null(:questions, :alternatives, false)
  end

  def down
    change_column_null(:questions, :alternatives, true)
    change_column_default(:questions, :alternatives, from: [], to: nil)

    execute("UPDATE questions SET alternatives = null WHERE alternatives = '[]'")
  end
end
