# frozen_string_literal: true
module Types
  class BaseConnection < Types::BaseObject
    include GraphQL::Types::Relay::ConnectionBehaviors
    node_nullable(false)
  end
end
