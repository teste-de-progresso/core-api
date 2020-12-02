# frozen_string_literal: true

class AddTypeFieldToObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :check_type, :string
  end
end
