# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_question, mutation: Mutations::CreateQuestion
    field :update_question, mutation: Mutations::UpdateQuestion
    field :destroy_question, mutation: Mutations::DestroyQuestion
    field :finish_question, mutation: Mutations::FinishQuestion
    field :create_feedback, mutation: Mutations::CreateFeedback
  end
end
