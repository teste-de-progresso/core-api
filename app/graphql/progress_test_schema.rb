# frozen_string_literal: true

class ProgressTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Dataloader
end
