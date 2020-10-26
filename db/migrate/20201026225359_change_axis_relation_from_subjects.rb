class ChangeAxisRelationFromSubjects < ActiveRecord::Migration[6.0]
  def change
    change_column :subjects, :axis_id, null: true
  end
end
