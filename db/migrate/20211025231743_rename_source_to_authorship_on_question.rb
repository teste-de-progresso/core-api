# frozen_string_literal: true
class RenameSourceToAuthorshipOnQuestion < ActiveRecord::Migration[6.0]
  def change
    rename_column(:questions, :source, :authorship)
  end
end
