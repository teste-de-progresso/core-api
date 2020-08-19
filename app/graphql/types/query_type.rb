# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_objective_questions,
          [Questions::Objective],
          null: true,
          description: 'Get all objective questions without pagination.'

    field :search_objective_questions,
          [Questions::Objective],
          null: true,
          description: 'Search by objective questions by body or status.' do
            argument :body, String, required: false
            argument :status, String, required: false
            argument :user_id, Integer, required: true
            argument :page, Integer, required: true
          end

    field :get_objective_question,
          Questions::Objective,
          null: true,
          description: 'Get one objective question by ID.' do
            argument :id, ID, required: true
          end

    def search_objective_questions(body: nil, status: nil, user_id:, page:)
      params = {}
      params[:body] = body if body
      params[:status] = status if status
      params[:user_id] = user_id

      Objective.where(params).page(page).limit(20)
    end

    def get_objective_question(id:)
      Objective.find(id)
    end

    def all_objective_questions
      Objective.all
    end
  end
end
