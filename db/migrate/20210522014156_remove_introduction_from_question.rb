# frozen_string_literal: true
class RemoveIntroductionFromQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column(:questions, :introduction)
  end
end
