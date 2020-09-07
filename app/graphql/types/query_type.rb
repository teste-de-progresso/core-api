# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :search_objective_questions,
          [Questions::Objective],
          null: true,
          description: 'Search by objective questions by body or status.' do
            argument :page, Integer, required: true
            argument :limit, Integer, required: true
            argument :user_id, Integer, required: true
          end

    field :get_objective_question,
          Questions::Objective,
          null: true,
          description: 'Get one objective question by ID.' do
            argument :id, ID, required: true
          end

    field :my_user, Users::Details, null: false,
                                    description: 'Get you current user Details.'

    def search_objective_questions(user_id:, page:, limit:)
      Objective.where(user_id: user_id).page(page).per(limit)
    end

    def get_objective_question(id:)
      Objective.find_by(id: id)
    end

    def my_user
      context[:current_user]
    end
  end
end
