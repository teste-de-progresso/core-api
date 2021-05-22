# frozen_string_literal: true
class RemoveFilenameFromUploads < ActiveRecord::Migration[6.0]
  def change
    remove_column(:uploads, :filename)
  end
end
