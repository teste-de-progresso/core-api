# typed: true
# frozen_string_literal: true

class RemoveCategoryReferenceFromAxes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :axes, :sub_category
  end
end
