# frozen_string_literal: true

module Mutations
  module Questions
    module Objective
      class Save < BaseMutation
        graphql_name 'saveObjective'

        field :payload, Types::Questions::Objective, null: true
        field :errors, [Types::ResponseErrorType], null: true

        argument :objective_question, Inputs::Questions::Objective::Save, required: true

        def resolve(objective_question:)
          @question = find_or_initialize_question(objective_question[:id])

          define_params(objective_question)

          return { payload: @question } if @question.valid? && @question.save!

          { errors: ::ResponseError.from_active_record_model(@question) }
        end

        def find_or_initialize_question(id)
          id ? ::Objective.find(id) : ::Objective.new
        end

        def define_params(objective_question)
          @question.body = objective_question[:body] || @question.body
          @question.alternatives = objective_question[:alternatives] || @question.body
          @question.explanation = objective_question[:explanation] || @question.body
          @question.status = objective_question[:status] || @question.body
        end
      end
    end
  end
end
