# frozen_string_literal: true

class ChangeSubjectAxisReference < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:subjects, :axis_id, true)
  end
end
