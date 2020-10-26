# frozen_string_literal: true

class AddCategoryReferenceToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :subjects, :category
  end
end
