# frozen_string_literal: true

module Mutations
  module Questions
    class SaveObjective < BaseMutation
      graphql_name 'saveObjective'

      type Types::Questions::ObjectiveResponse

      argument :objective_question, Inputs::Questions::SaveObjective, required: true

      def resolve(objective_question:)
        input = objective_question.to_h
        user = context[:current_user]

        question = input[:id] ? ::Objective.find_by(id: input[:id]) : ::Objective.new(user_id: user.id)
        policy = QuestionPolicy.new(user, question)

        return {} unless input[:id] ? policy.update? : policy.create?
        return { payload: question } if question.update(input)

        { errors: ::ResponseError.from_active_record_model(question) }
      end
    end
  end
end
