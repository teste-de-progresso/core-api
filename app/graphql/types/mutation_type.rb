# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_question, mutation: Mutations::CreateQuestion
    field :update_question, mutation: Mutations::UpdateQuestion
    field :destroy_question, mutation: Mutations::DestroyQuestion
    field :finish_question, mutation: Mutations::FinishQuestion
    field :send_feedback, mutation: Mutations::Review::SendFeedback
  end
end
