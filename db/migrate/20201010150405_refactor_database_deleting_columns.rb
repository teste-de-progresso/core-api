class RefactorDatabaseDeletingColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :subjects, :axis_id, :integer
    remove_column :axes, :sub_category_id, :integer    
  end
end
