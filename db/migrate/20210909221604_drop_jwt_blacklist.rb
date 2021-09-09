# frozen_string_literal: true
class DropJwtBlacklist < ActiveRecord::Migration[6.0]
  def change
    drop_table(:jwt_blacklists)
  end
end
