# typed: true
# frozen_string_literal: true

class RemoveUserReferenceFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_reference :uploads, :user
  end
end
