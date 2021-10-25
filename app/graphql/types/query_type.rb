# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :questions, QuestionType.connection_type, null: false do
      argument :where, Inputs::QuestionWhereInput, required: false
    end
    def questions(where: nil)
      Resolvers::QuestionsQueryResolver.new(context, where).resolve
    end

    field :subjects, SubjectType.connection_type, null: false
    def subjects
      Resolvers::SubjectsQueryResolver.new(context).resolve
    end

    field :reviewers, UserType.connection_type, null: false
    def reviewers
      Resolvers::ReviewersQueryResolver.new(context).resolve
    end

    field :current_user, UserType, null: true
    def current_user
      context[:current_user]
    end
  end
end
