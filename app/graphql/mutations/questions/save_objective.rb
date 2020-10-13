# frozen_string_literal: true

module Mutations
  module Questions
    class SaveObjective < BaseMutation
      graphql_name 'saveObjective'

      type Types::Questions::ObjectiveResponse

      argument :objective_question, Inputs::Questions::SaveObjective, required: true

      def resolve(objective_question:)
        input = objective_question.to_h
        reviewer_id = input.delete(:reviewer_id)
        user = context[:current_user]

        question = input[:id] ? ::Objective.find_by(id: input[:id]) : ::Objective.new(user_id: user.id)
        policy = QuestionPolicy.new(user, question)

        return {} unless input[:id] ? policy.update? : policy.create?

        if question.update(input)
          ::ReviewRequest.create(objective_id: question.id, user_id: reviewer_id) if reviewer_id

          return { payload: question }
        end

        { errors: ::ResponseError.from_active_record_model(question) }
      end
    end
  end
end
