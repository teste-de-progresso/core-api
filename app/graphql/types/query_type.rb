# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :search_objective_questions,
          [Questions::Objective],
          null: true,
          description: 'Search by objective questions by body or status.' do
            argument :body, String, required: false
            argument :status, String, required: false
            argument :page, Integer, required: true
            argument :limit, Integer, required: false
            argument :user_id, Integer, required: true
          end

    field :get_objective_question,
          Questions::Objective,
          null: true,
          description: 'Get one objective question by ID.' do
            argument :id, ID, required: true
          end

    def search_objective_questions(body:, status:, user_id:, page:, limit: 20)
      params = {}
      params[:body] = body if body
      params[:status] = status if status
      params[:user_id] = user_id

      Objective.where(params)
               .page(page)
               .limit(limit)
    end

    def get_objective_question(id:)
      Objective.find(id)
    end
  end
end
