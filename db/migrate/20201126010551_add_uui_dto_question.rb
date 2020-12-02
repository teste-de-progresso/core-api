# typed: true
# frozen_string_literal: true

class AddUuiDtoQuestion < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'
    add_column :questions, :uuid, :uuid, default: 'uuid_generate_v4()', null: false
    add_index :questions, :uuid
  end
end
