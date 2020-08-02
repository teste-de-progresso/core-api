# frozen_string_literal: true

module Mutations
  module Questions
    class SaveObjective < BaseMutation
      field :payload, Types::Questions::ObjectiveType, null: true
      field :errors, [Types::ResponseErrorType], null: true

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
        @question = find_or_initialize_question(objective_input[:id])

        define_params(objective_input)

        return { payload: @question } if @question.valid? && @question.save!

        { errors: ResponseError.from_active_record_model(@question) }
      end

      def find_or_initialize_question(id)
        id ? Objective.find(id) : Objective.new
      end

      def define_params(objective_input)
        @question.body = objective_input[:body]
        @question.alternatives = objective_input[:alternatives]
        @question.correct_answer = objective_input[:correct_answer]
        @question.status = objective_input[:status]
      end
    end
  end
end
