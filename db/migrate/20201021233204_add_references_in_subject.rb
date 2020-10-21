# frozen_string_literal: true

class AddReferencesInSubject < ActiveRecord::Migration[6.0]
  def change
    add_reference :subjects, :category, foreign_key: true
    add_reference :subjects, :sub_category, foreign_key: true
  end
end
