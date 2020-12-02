# frozen_string_literal: true

class AddUserReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :uploads, :user, foreign_key: true
  end
end
