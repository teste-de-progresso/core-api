# frozen_string_literal: true

class ChangeAxisRelationFromSubjects < ActiveRecord::Migration[6.0]
  def change
    change_column :subjects, :axis_id, :integer, null: true
  end
end
