# frozen_string_literal: true
class ProgressTestSchema < GraphQL::Schema
  DEFINITION_DUMP_PATH = "app/graphql/schema.graphql"

  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Dataloader

  def self.resolve_type(_abstract_type, obj, _ctx)
    case obj
    when Question
      Types::QuestionType
    else
      raise("Unexpected object: #{obj}")
    end
  end

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, _query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.constantize.find(item_id)
  end
end

# https://github.com/rmosolgo/graphql-ruby/issues/1505#issuecomment-428693570
ProgressTestSchema.graphql_definition
