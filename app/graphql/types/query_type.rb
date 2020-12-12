# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :questions, Questions::Collection, null: false do
      argument :where, Inputs::Question::Where, required: false
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

    field :my_user, Types::Core::User, null: true

    def my_user
      context[:current_user]
    end

    field :reviewers, [Types::Core::User], null: false

    def reviewers
      User.joins(:roles).where(roles: { name: %i[teacher nde] })
          .where.not(id: context[:current_user].id).distinct
    end
  end
end
