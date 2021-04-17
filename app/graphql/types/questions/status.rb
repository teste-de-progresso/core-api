# frozen_string_literal: true

module Types
  module Questions
    class Status < Types::BaseEnum
      value "draft"
      value "pending"
      value "approved"
      value "finished"
    end
  end
end
