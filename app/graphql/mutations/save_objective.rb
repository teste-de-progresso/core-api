# frozen_string_literal: true

module Mutations
  class SaveObjective < BaseMutation
    field :objective, Types::ObjectiveType, null: true

    class AlternativeInput < Types::BaseInputObject
      argument :identifier, String, required: true
      argument :text, String, required: true
      argument :explanation, String, required: false
    end

    class ObjectiveInput < Types::BaseInputObject
      argument :id, ID, required: false
      argument :body, String, required: true
      argument :alternatives, [AlternativeInput], required: false # TODO: alternatives should be mandatory
      argument :correct_answer, String, required: true
      argument :status, String, required: true
    end

    argument :objective_input, ObjectiveInput, required: true

    def resolve(objective_input:)
      objective_question = find_or_initialize_objective_question(objective_input[:id])

      objective_question = define_params(objective_question, objective_input)

      { objective: objective_question } if objective_question.save!
    end

    def find_or_initialize_objective_question(id)
      id ? Objective.find(id) : Objective.new
    end

    def define_params(objective_question, objective_input)
      objective_question.body = objective_input[:body] if objective_input[:body]
      objective_question.alternatives = objective_input[:alternatives] if objective_input[:alternatives]
      objective_question.correct_answer = objective_input[:correct_answer] if objective_input[:correct_answer]
      objective_question.status = objective_input[:status] if objective_input[:status]

      # TODO: connect the logged user to the created question.
      # objective_question.user_id = current_user.id unless objective_input[:id]

      objective_question
    end
  end
end
