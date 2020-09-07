# frozen_string_literal: true

module Mutations
  module Questions
    class SaveObjective < BaseMutation
      graphql_name 'saveObjective'

      type Types::Questions::ObjectiveResponse

      argument :objective_question, Inputs::Questions::SaveObjective, required: true

      def resolve(objective_question:)
        @question = find_or_initialize_question(objective_question[:id])

        return { payload: @question } if @question.update(objective_question.to_h)

        { errors: ::ResponseError.from_active_record_model(@question) }
      end

      def find_or_initialize_question(id)
        user_id = context[:current_user].id

        if id
          ::Objective.find_by(id: id, user_id: user_id)
        else
          ::Objective.new(user_id: user_id)
        end
      end
    end
  end
end
