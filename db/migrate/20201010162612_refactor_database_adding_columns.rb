class RefactorDatabaseAddingColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :sub_categories, :category_id

    add_reference :axes, :subject, foreign_key: true
    add_reference :categories, :axis, foreign_key: true
    add_reference :sub_categories, :category, foreign_key: true
  end
end
