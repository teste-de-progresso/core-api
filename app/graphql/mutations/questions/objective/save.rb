# frozen_string_literal: true

module Mutations
  module Questions
    module Objective
      class Save < BaseMutation
        graphql_name 'saveObjective'

        type Types::Questions::ObjectiveResponse

        argument :objective_question, Inputs::Questions::Objective::Save, required: true

        def resolve(objective_question:)
          @question = find_or_initialize_question(objective_question[:id])
          @question.update(objective_question.to_h)

          return { payload: @question } if @question.valid? && @question.save!

          { errors: ::ResponseError.from_active_record_model(@question) }
        end

        def find_or_initialize_question(id)
          id ? ::Objective.find(id) : ::Objective.new
        end
      end
    end
  end
end
