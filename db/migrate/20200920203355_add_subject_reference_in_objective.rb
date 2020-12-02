# typed: true
# frozen_string_literal: true

class AddSubjectReferenceInObjective < ActiveRecord::Migration[6.0]
  def change
    add_reference :objectives, :subject, null: true, foreign_key: true
  end
end
