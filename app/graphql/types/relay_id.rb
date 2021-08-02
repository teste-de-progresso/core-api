# frozen_string_literal: true
module Types
  class RelayId < BaseScalar
    def self.coerce_input(value, _context)
      _, object_id = GraphQL::Schema::UniqueWithinType.decode(value)
      OpenStruct.new(decoded: object_id, encoded: value)
    end
  end
end
