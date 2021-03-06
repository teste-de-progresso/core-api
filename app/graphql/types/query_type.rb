# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :questions, QuestionType.connection_type, null: false do
      argument :where, Inputs::QuestionWhereInput, required: false
    end
    def questions(where: nil)
      Resolvers::QuestionsQueryResolver.new(Question, where, context).resolve
    end

    field :subjects, SubjectType.connection_type, null: false
    def subjects
      Resolvers::SubjectsQueryResolver.new(Subject, context).resolve
    end

    field :reviewers, Types::Core::UserType.connection_type, null: false
    def reviewers
      Resolvers::ReviewersQueryResolver.new(User, context).resolve
    end

    field :current_user, Types::Core::UserType, null: true
    def current_user
      context[:current_user]
    end
  end
end
