# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_objective_questions,
          [Questions::ObjectiveType],
          null: true,
          description: 'Get all objective questions without pagination.'

    field :search_objective_questions,
          [Questions::ObjectiveType],
          null: true,
          description: 'Search by objective questions by body or status.' do
            argument :body, String, required: false
            argument :status, String, required: false
          end

    field :get_objective_question,
          Questions::ObjectiveType,
          null: true,
          description: 'Get one objective question by ID.' do
            argument :id, ID, required: true
          end

    def search_objective_questions(body: nil, status: nil)
      params = {}
      params[:body] = body if body
      params[:status] = status if status

      query = Objective.ransack(params)
      query.result
    end

    def get_objective_question(id:)
      Objective.find(id)
    end

    def all_objective_questions
      Objective.all
    end
  end
end
