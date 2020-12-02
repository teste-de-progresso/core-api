# frozen_string_literal: true

class AddSupportToObjectives < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :support, :text
  end
end
