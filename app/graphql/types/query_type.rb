# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :questions, Questions::Collection, null: false do
      argument :where, Inputs::Question::Where, required: false
    end

    def questions(where: nil)
      Resolvers::ObjectiveResolver.new(context, where).payload
    end

    field :question, Questions::Objective, null: true do
      argument :id, ID, required: true
    end

    def question(id:)
      Objective.find_by(id: id)
    end

    field :subjects, [SubjectType], null: false

    def subjects
      Subject.all
    end

    field :my_user, Users::Details, null: false

    def my_user
      context[:current_user]
    end

    field :reviewers, [Users::Details], null: false

    def reviewers
      User.joins(:roles).where(roles: { name: %i[teacher nde] })
          .where.not(id: context[:current_user].id).distinct
    end
  end
end
