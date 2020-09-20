# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :objective_questions, Questions::ObjectiveCollection, null: false

    field :objective_question, Questions::Objective, null: true do
      argument :id, ID, required: true
    end

    field :my_user, Users::Details, null: false

    def objective_questions
      context[:current_user].objectives
    end

    def objective_question(id:)
      Objective.find_by(id: id)
    end

    def my_user
      context[:current_user]
    end
  end
end
