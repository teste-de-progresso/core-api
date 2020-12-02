# typed: true
# frozen_string_literal: true

class AddIntroductionToObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :introduction, :string
  end
end
