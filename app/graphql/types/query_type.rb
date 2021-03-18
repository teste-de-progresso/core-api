# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :questions, Questions::Base.connection_type, null: false do
      argument :where, Inputs::QuestionWhereInput, required: false
    end

    def questions(where: nil)
      Resolvers::QuestionResolver.new(context, where).payload
    end

    field :question, Questions::Base, null: true do
      argument :uuid, ID, required: true
    end

    def question(uuid:)
      Question.find_by(uuid: uuid)
    end

    field :subjects, [SubjectType], null: false

    def subjects
      Subject.all
    end

    field :current_user, Types::Core::UserType, null: true

    def current_user
      context[:current_user]
    end

    field :reviewers, [Types::Core::UserType], null: false

    def reviewers
      User.joins(:roles).where(roles: { name: %i[teacher nde] })
        .where.not(id: context[:current_user].id).distinct
    end
  end
end
